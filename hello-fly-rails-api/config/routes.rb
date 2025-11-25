Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"

  # Health check endpoint
  get "health", to: "application#health"

  # API namespace for future expansion
  namespace :api do
    namespace :v1 do
      get "info", to: "info#show"
    end
  end
end
