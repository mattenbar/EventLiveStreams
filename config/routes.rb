Rails.application.routes.draw do

  root 'sessions#home'
  get '/home' => 'events#home'
  get '/profile' => 'users#profile'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fbcreate'
  
  resources :comments
  resources :favorites
  resources :genres, only: [:new, :create, :index, :show]
  resources :events
  resources :users, only: [:new, :create, :show]

  resources :events do
    resources :comments, only: [:new, :create, :index]
  end
  
end
