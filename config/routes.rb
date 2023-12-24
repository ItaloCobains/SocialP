require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: 'articles#index'
  resources :articles do
    resources :comments
  end

  get 'home', to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
