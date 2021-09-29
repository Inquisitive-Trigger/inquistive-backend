Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'application#index'

  get "projects/search" => "projects#search"

  get "user/followings" => "user#followings"
  get "user/followers" => "user#followers"

  resources :session, only: [:create]
  resources :user, only: [:create]
  resources :projects, only: [:index, :show, :create, :update, :destroy] do
    resources :application_companies, only: [:index], controller: 'projects/application_companies'
  end
  resources :application_companies, only: [:index, :show, :create, :update, :destroy] do
    resource :project_approvals, only: [:create], controller: 'application_companies/project_approvals'
    resource :project_denials, only: [:create], controller: 'application_companies/project_denials'
  end
end
