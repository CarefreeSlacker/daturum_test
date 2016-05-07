Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations/registrations' }
  root to: 'main#index'

  resources :questions
end
