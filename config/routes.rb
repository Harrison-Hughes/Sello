Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/show'

  get 'orders/create'

  root to: "products#index"
  get "/login", to: "sessions#new", as: "new_session"
  post "/login", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  resources :products
  resources :users, except: %i[index]

  resources :orders
end
