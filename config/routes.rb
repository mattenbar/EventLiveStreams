Rails.application.routes.draw do

  get '/signup' => 'users#new'

  resources :favorites
  resources :genres
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
