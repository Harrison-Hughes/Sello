Rails.application.routes.draw do
  # #get 'static_pages/index'

  root to: "static_pages#index"
  get "/login", to: "sessions#new", as: "new_session"
  post "/login", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  resources :products
  resources :users, except: %i[index]
end
