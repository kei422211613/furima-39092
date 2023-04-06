Rails.application.routes.draw do
  devise_for :items
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
end
