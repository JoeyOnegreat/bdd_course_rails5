Rails.application.routes.draw do
  
  get 'firms/index'
  root to: "users#index"

  resources :users
  resources :firms
end
