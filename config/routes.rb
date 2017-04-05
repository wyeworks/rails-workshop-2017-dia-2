Rails.application.routes.draw do
  devise_for :users

  resources :boards do
    resources :lists, only: [:new, :create]
  end

  root 'boards#index'
end
