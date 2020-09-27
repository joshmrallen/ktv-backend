Rails.application.routes.draw do
  resources :favorites
  # post '/search', to: 'search#search_handler'
  # get '/results', to: 'search#index'
  resources :searches
  resources :videos
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
