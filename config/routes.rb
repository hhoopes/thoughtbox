Rails.application.routes.draw do
  root to: "static_pages#home"
  # post '/', to: "links#create", as: "links"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :links, only: [:create]
end
