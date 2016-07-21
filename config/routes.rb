Rails.application.routes.draw do

  root 'users#index'
  resources :listings
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, only: [:show, :edit, :update, :destroy] 

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get '/users/:id/listings' => "users#mylistings", as: "mylistings"

end
