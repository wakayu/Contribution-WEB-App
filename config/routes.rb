Rails.application.routes.draw do
  devise_for :users#ログインまわりで必要なルーティングを一気に生成
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]

  #get 'tweets' => 'tweets#index'	#ツイート一覧
  #get 'tweets/new' => 'tweets#new'	#ツイート投稿一覧
  #post 'tweets' => 'tweets#create'	#ツイート投稿機能
  #delete 'tweets/:id' => 'tweets#destroy'#ツイート削除機能
  #patch 'tweets/:id' => 'tweets#update'#編集後の更新機能
  #get 'tweets/:id/edit' => 'tweets#edit' #編集機能
  #get 'users/:id' => 'users#show'	#Mypageへのルーティング
  #get 'tweets/:id' => 'tweets#show'#ツイート詳細画面
end