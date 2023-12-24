require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root to: 'articles#index'
  resources :articles do
    resources :comments
  end

  get 'home', to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
