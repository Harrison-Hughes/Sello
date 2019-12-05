Rails.application.routes.draw do
  root to: "products#index"
  get "/login", to: "sessions#new", as: "new_session"
  post "/login", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  resources :products
  resources :users, except: %i[index]
  get'/users/:id/basket', to: 'products#basket', as: "basket"
  get'/users/:id/checkout', to: 'products#checkout', as: "checkout"
  post'/users/:id/checkout', to: 'products#place_order', as: "place_order"
  post'/users/:id/orders', to: 'orders#past_orders', as: 'orders'
  get'/orders/:order_id', to: 'orders#order_details', as: 'order'
end
