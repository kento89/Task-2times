Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update]
end