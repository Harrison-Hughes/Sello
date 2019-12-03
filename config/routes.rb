Rails.application.routes.draw do
  root "sessions#new", as: "new_session"
  post "/", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  resources :products
  resources :users, except: %i[index]
end
