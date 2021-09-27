Rails.application.routes.draw do
  root 'application#index'

  get "projects/search" => "projects#search"

  resources :session, only: [:create]
  resources :user, only: [:create]
  resources :projects, only: [:index, :show, :create]
  resources :application_companies, only: [:create]
end
