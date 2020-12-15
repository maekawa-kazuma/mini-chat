Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'rooms#index'
  resources :users, only: [:new]
  resources :rooms, only: %i[show]
end