Rails.application.routes.draw do

  root to: 'home#index'

  get 'signup' => 'users#new', as: :signup

  get '/login'  => 'sessions#new', as: :login
  post '/login'  => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :home
  resources :users
  resources :sessions
  resources :sportsters
  resources :profiles
  resources :admins
  resources :articles
  resources :sports

  resources :users do
    resources :profiles
  end

resources :articles, except: [:edit, :update, :destroy] do
    resources :comments, only: [:create]
  end

end
