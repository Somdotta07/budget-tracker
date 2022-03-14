Rails.application.routes.draw do
  devise_for :users
  # root to: 'users#index'
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'users#index'
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:index]
  resources :groups, except: %i[edit update] do
    resources :expenses, except: %i[edit update]
  end
end
