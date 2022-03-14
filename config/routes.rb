Rails.application.routes.draw do
  resources :expenses
  devise_for :users
  root to: 'users#index'
  resources :groups
  resources :users
end
