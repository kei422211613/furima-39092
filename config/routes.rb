Rails.application.routes.draw do
  devise_for :items
  devise_for :users
  root to: "items#index"
  resources :users, only: [:index, :new, :create] do
    resources :items, only: [:new, :create]
  end
end