Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/history', to: 'static_pages#history'
  get '/ground', to: 'static_pages#ground'
  get '/sponsors', to: 'sponsors#index'
  get '/players', to: 'players#index'
  get '/events', to: 'events#index'
  get '/signup', to: 'users#new'
  get '/users', to: 'users#create'
  resources :players
  resources :clubs
  resources :events
  resources :sponsors
  resources :fixtures
end
