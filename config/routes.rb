Rails.application.routes.draw do
  get 'search/index'
  root to: 'app#index'
  get 'search' => 'search#index'
  devise_for :users
  get 'app/index'
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
