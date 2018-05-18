Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/history', to: 'static_pages#history'
  get '/ground', to: 'static_pages#ground'
  get '/sponsors', to: 'sponsors#index'
  get '/players', to: 'players#index'
  get '/events', to: 'events#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :players
  resources :clubs
  resources :events
  resources :sponsors
  resources :fixtures
  resources :users
end
