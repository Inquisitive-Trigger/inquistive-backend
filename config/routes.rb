Rails.application.routes.draw do
  root 'application#index'

  resources :session, only: [:create]
end
