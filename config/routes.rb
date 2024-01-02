require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :projects do
    resources :votes
  end

  root "projects#index"

  get 'home', to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
