Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "top#top"
  resources :comics

  resources :comic_boards, only: [:show, :create] do
    resources :comments, only: [:create]
    post "/comments/:id/reply" => "comments#reply", as: "comment_reply"
  end

  post "/comments/:id/favorite" => "favorites#create", as:"favorite_create"
  delete "/comments/:id/favorite" => "favorites#destroy", as: "favorite_destroy"
end
