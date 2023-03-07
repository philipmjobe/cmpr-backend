Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  ### USER ROUTES ###
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
end
