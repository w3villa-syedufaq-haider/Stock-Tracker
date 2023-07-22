Rails.application.routes.draw do
  
  resources :user_stocks, only: [:create, :destroy]
  resources :friendship, only: [:create, :destroy]

  get 'stocks/search'
  get '/my_friends' , to:'users#my_friends'
  get '/my_portfolio' , to:'users#my_portfolio'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'search_stock' , to: 'stocks#search'
  get 'search_friend' , to: 'users#search'

  # Defines the root path route ("/")
  root "welcome#index"
end
