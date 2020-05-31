Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/homepage', to: 'users#homepage'
  resources :sessions, only: [:new, :create]
end
