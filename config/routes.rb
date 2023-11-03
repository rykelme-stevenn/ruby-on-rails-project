Rails.application.routes.draw do
  # get "up" => "rails/health#show", as: :rails_health_check

  # Rota resources pois é um CRUD
  resources :posts
end
