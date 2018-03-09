Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/history', to: 'static_pages#history'
  get '/ground', to: 'static_pages#ground'
  get '/sponsors', to: 'static_pages#sponsors'
  get '/players', to: 'players#index'
  get '/events', to: 'events#index'
end
