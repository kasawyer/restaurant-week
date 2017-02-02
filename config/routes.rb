Rails.application.routes.draw do
  devise_for :admins
  root 'restaurants#index'

  devise_for :users

  resources :users, only: [:index, :destroy]

  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end

end
