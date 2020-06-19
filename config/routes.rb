Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :point_recievers
      resources :favorites
      resources :points
      resources :comics
      resources :notifications
      resources :comments
      resources :comic_boards
      resources :relationships

      root to: "users#index"
    end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root to: "top#top"

  resources :users
  resources :comics

  resources :comic_boards, only: [:show, :create] do
    resources :comments, only: [:create]
    post "/comments/:id/reply" => "comments#reply", as: "comment_reply"
  end

  # いいね機能
  post "/comments/:id/favorite" => "favorites#create", as:"favorite_create"
  delete "/comments/:id/favorite" => "favorites#destroy", as: "favorite_destroy"

  # フォロー機能
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  
  resources :points do
    post "/point_send_users" => "notifications#point_send", as: "send"
  end
  resources :notifications, only: [:index, :update]

end
