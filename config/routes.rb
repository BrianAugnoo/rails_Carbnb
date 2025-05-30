Rails.application.routes.draw do
  get "user_name/new"
  get "home/index"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"
  get "account" => "home#account", as: :account
  resources :cars do
    resources :bookings, only: [ :new, :create ]
    #Ryan added update and destroy in reviews resources below
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :bookings, except: [ :new, :create ] do
    member do
      patch :accept
    end
    resources :notifications, only: [ :create ]
  end
  resources :reviews, except: [ :new, :create ]
  resources :notifications, except: [ :new, :create ] do
    member do
      post :mark_as_read
    end
  end
  resources :dashboards, only: [ :index ]
  resources :user_name, only: [ :new, :create ]
end
