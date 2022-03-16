Rails.application.routes.draw do
  
  root to: "customers#index"
  get '/customers/approve' => 'customers#approve'
  resources :customers
  mount API::Base, at: "/"
end
