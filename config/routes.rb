Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/user_products', to: 'products#user_products'
  get '/user_sales', to: 'sales#user_sales'
  get '/my_sales', to: 'sales#my_sales'
  resources :products do
    resources :sales, only: [:new, :create, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
