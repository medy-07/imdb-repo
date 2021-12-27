# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  # get 'movies/index'
  # get "/actors", to: "actors#index"

  root "main#index"
  resources :movies do
    resources :comments
  end
  resources :directors
  resources :actors
end
