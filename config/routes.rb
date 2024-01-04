require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  authenticate :user do
    get '/kanban', to: 'kanban#index'
    get '/boards', to: 'boards#new'
  end


  resources :projects do
    resources :votes
  end

  get 'home', to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
  root 'landing_page#index'
end
