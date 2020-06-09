Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "top#top"
  resources :comics

  get "comicboards/:id" => "comic_boards#show", as: "comic_board"
  post "comicboards/create" => "comic_boards#create"
  
end
