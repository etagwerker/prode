Rails.application.routes.draw do
  resources :games, only: [:index]
  resources :teams, only: [:index]
  resources :groups, only: [:index]
  root "games#index"
end
