Rails.application.routes.draw do
  post '/search', to: 'users#search_handler'
  resources :videos
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
