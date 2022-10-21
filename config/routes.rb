Rails.application.routes.draw do
  devise_for :users
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :items, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
