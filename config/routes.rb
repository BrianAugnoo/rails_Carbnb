Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"
  resources :cars do
    resources :bookings, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, except: [ :new, :create ] do
    resources :notifications, only: [ :new, :create ]
  end
  resources :reviews, except: [ :new, :create ]
  resources :notifications, except: [ :new, :create ]
end
