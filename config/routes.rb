require 'sidekiq/web'

Rails.application.routes.draw do
  resources :projects
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root "projects#index"
  get 'home', to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
