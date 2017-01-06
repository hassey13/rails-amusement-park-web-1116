Rails.application.routes.draw do

  root 'users#index'
  resources :users, :attractions
  resources :sessions, except: [:new, :destroy]
  get '/signin', to: 'sessions#new', as: 'signin'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
  post '/attractions/:id', to: 'attractions#ride', as: 'take_ride'

end
