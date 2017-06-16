class TweetsController < ApplicationController
	before_action :move_to_index, except: :index

	def index					#ツイート一覧
		@tweets = Tweet.includes(:user).all.order("created_at DESC").page(params[:page]).per(5)
	end

	def new						#投稿画面
	end

	def create					#レコード保存
		Tweet.create(image:tweet_params[:image],text:tweet_params[:text],user_id:current_user.id)
		#binding.pry
	end

	def destroy					#ツイート削除
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      end
    end

    def edit					#編集
    	@tweet = Tweet.find(params[:id])
    end

    def update					#編集
     tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
      	#ツイートIDとログインしているユーザーのIDが一致しているか
        tweet.update(tweet_params)
      end
    end

    def show					#詳細
    	@tweet = Tweet.find(params[:id])
    	@comments = @tweet.comments.includes(:user)
    end

	private
	def tweet_params
		params.permit(:image, :text)
	end

	def move_to_index
		redirect_to action: :index unless user_signed_in?#ログインしていなかったらindexに強制移動
	end
end
