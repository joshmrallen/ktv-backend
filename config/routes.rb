Rails.application.routes.draw do

  resources :rooms
  resources :users, only: [:index, :show, :create]
  #Login route
  post '/login', to: 'auth#create'
  #Retrieve user info to stay logged in -- verfy JWT token
  get '/profile', to: 'users#profile'
  #delete a favorite
  post '/favorites/delete', to: 'favorites#destroy'

  resources :favorites
  # post '/search', to: 'search#search_handler'
  # get '/results', to: 'search#index'
  resources :searches
  resources :videos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
