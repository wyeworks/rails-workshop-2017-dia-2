Rails.application.routes.draw do
  resources :boards do
    collection do
      post 'import'
    end

    resources :lists, only: [:new, :create], shallow: true do
      resources :cards, only: :create
    end
  end

  resource :user, only: [:edit, :update]

  devise_for :users

  root 'boards#index'
end
