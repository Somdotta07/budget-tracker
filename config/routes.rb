Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  resources :users, only: %i[index show] do
    resources :groups, only: %i[index create new show destroy]
  end
  resources :groups, only: [:index, :show, :new, :create] do
    resources :expenses, only: [:new, :create]
  end
end
