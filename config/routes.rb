Rails.application.routes.draw do

  root 'sessions#home'
  get '/home' => 'users#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :favorites
  resources :genres
  resources :events
  resources :users, only: [:new, :create, :show]
  
end
