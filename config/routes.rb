Rails.application.routes.draw do

  root to: 'home#index'

  get 'signup' => 'users#new', as: :signup

  get '/login'  => 'sessions#new', as: :login
  post '/login'  => 'sessions#create'

  resources :home
  resources :users
  resources :sessions
  resources :sportsters

end
