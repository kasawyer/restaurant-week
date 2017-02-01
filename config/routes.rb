Rails.application.routes.draw do
  devise_for :create_admins
  devise_for :admins
  root 'restaurants#index'

  devise_for :users

  resources :users, only: [:index, :destroy]

  resources :restaurants, only: [:index, :show]
end
