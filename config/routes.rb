Rails.application.routes.draw do
  devise_for :users

  resources :boards do
    resources :lists, only: [:new, :create], shallow: true do
      resources :cards, only: :create
    end
  end

  root 'boards#index'
end
