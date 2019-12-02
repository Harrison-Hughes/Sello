Rails.application.routes.draw do
  root "welcome#home"
  resource :products, only: [:new, :show, :create, :eidt]
end
