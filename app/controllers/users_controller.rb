class UsersController < ApplicationController
	def show
		user = User.find(params[:id])
		@nickname = user.nickname
		#@tweets = Tweet.where(user_id:current_user.id).all.order("created_at DESC").page(params[:page]).per(5)
		@tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
	end
end
