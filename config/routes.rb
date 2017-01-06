Rails.application.routes.draw do

  root 'users#index'
  resources :users, :attractions
  resources :sessions, except: [:new]
  get '/signin', to: 'sessions#new', as: 'signin'

end
