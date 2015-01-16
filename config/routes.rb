Rails.application.routes.draw do

  root to: 'home#index'

  resources :home
  resources :sportsters
  resources :users

end
