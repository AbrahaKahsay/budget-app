Rails.application.routes.draw do
  root "pages#home"
  devise_for :users

  resources :users

  resources :categories, only: [:index,:show, :new, :create] do
    resources :expenses, only: [:index, :show, :new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
