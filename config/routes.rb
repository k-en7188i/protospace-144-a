Rails.application.routes.draw do
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :show]
end
