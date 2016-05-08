Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations/registrations' }
  root to: 'main#index'

  resources :questions
  resources :answers, only: [:create, :update, :destroy]
  resources :corrections, only: [:create, :update, :destroy]
end
