Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "top#top"
  resources :comics

  resources :comic_boards, only: [:show, :create] do
    resources :comments, only: [:create]
  end
end
