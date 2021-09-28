Rails.application.routes.draw do
  root 'application#index'

  get "projects/search" => "projects#search"

  resources :session, only: [:create]
  resources :user, only: [:create]
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  resources :application_companies, only: [:show, :create, :update, :destroy] do
    resource :project_approvals, only: [:create], controller: 'application_companies/project_approvals'
    resource :project_denials, only: [:create], controller: 'application_companies/project_denials'
  end
end
