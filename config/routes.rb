Rails.application.routes.draw do
  
  root to: "products#index"
  get "/login", to: "sessions#new", as: "new_session"
  post "/login", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  resources :products
  resources :users, except: %i[index]
  get'/basket', to: 'products#basket', as: "basket"
  get'/checkout', to: 'products#checkout', as: "checkout"
  post'/checkout', to: 'products#place_order', as: "place_order"
  post'/orders', to: 'orders#past_orders', as: 'post_orders'
  get'/orders', to: 'orders#past_orders', as: 'orders'
  get'/orders/:order_id', to: 'orders#order_details', as: 'order'
  post'/add_to_basket', to: 'products#add_to_basket', as: "add_to_basket"
end
