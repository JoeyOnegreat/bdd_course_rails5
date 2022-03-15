Rails.application.routes.draw do
  
  root to: "customers#index"

  resources :customers
  mount API::Base, at: "/"
end
