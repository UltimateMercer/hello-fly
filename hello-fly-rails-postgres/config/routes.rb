Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"

  # Health check endpoint
  get "health", to: "application#health"

  # Database connection check
  get "db_health", to: "application#db_health"

  # API namespace for future expansion
  namespace :api do
    namespace :v1 do
      get "info", to: "info#show"
      resources :greetings, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
