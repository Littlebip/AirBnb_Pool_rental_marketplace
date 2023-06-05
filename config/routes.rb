Rails.application.routes.draw do
  devise_for :users
  root to: "pools#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pools, only: [ :index, :new, :create, :show ] do
    resources :bookings, only: [ :new, :create, :edit, :update ]
  end
  resources :bookings, only: :destroy
end
