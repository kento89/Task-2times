Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search' => 'search#search'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resource :search, only: [] do
    get :search_carender, on: :collection
  end
  
end