Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  ### USER ROUTES ###
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  ### CAMPGROUNDS ROUTES ###
  get "/campgrounds" => "campgrounds#index"
  post "/campgrounds" => "campgrounds#create"
  get "/campgrounds/:id" => "campgrounds#show"
  patch "/campgrounds/:id" => "campgrounds#update"
  delete "/campgrounds/:id" => "campgrounds#destroy"
end
