Rails.application.routes.draw do
  get 'users/index'
  get 'expenses/index'
  get 'expenses/new'
  get 'categories/index'
  get 'categories/new'
  root "splashes#index"
  devise_for :users

  resources :users
  resources :categories, only: [:index,:show, :new, :create] do
    resources :expenses, only: [:index, :show, :new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
