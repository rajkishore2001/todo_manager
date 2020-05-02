Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  #post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"

  resources :todos
  #rails routes!!

  post "users/login", to: "users#login"
  resources :users

  get "/", to: "home#index"

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
end
