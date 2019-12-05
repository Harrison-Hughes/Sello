Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/show'

  get 'orders/create'

  root to: "products#index"
  get "/login", to: "sessions#new", as: "new_session"
  post "/forgot_password", to: "users#forgot_password", as: "forgot_password"
  post "/retrieve_password/", to: "users#retrieve_password", as: "retrieve_password"
  patch "/password", to: "users#password", as: "password"
  get "/account_check", to: "users#account_check", as: "account_check"
  post "/login", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  resources :products
  resources :users, except: %i[index]
  resources :orders
end
