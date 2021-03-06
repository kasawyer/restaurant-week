Rails.application.routes.draw do
  root 'homes#index'

  devise_for :admins
  devise_for :users, controllers: { registrations: :registrations }

  resources :users, only: [:index, :destroy] do
    resources :favorites, only: [:index]
    resources :dineds, only: [:index]
    resources :reviews, only: [:index]
  end

  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show] do
        resources :reviews, only: [:index, :destroy]
        resources :favorites, only: [:index, :update]
        resources :dineds, only: [:index, :update]
      end
      resources :reviews, only: [:index, :update] do
        get 'total_votes'
        resources :users, only: [:index]
        resources :votes, only: [:index, :update]
      end
    end
  end
end
