Rails.application.routes.draw do
  root 'restaurants#index'

  devise_for :admins
  devise_for :users

  resources :users, only: [:index, :destroy] do
    resources :favorites, only: [:index]
  end

  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show] do
        resources :reviews, only: [:index, :destroy]
        resources :favorites, only: [:index, :create]
      end
      resources :reviews, only: [:index, :update] do
        get 'total_votes'
        resources :users, only: [:index]
        resources :votes, only: [:create]
      end
    end
  end
end
