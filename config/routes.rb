Rails.application.routes.draw do
  root 'application#index'

  resources :session, only: [:create]
  resources :user, only: [:create]
  resources :projects, only: [:index]
end
