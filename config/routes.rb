Rails.application.routes.draw do
  resources :tournaments do
    member do
      post 'join'
    end
  end

  resources :forecasts

  resources :users

  resources :games
  resources :teams
  resources :groups
  root "games#index"
  get '/auth/:provider/callback' => 'sessions#create', as: :auth_callback
  delete '/sessions/:id' => 'sessions#destroy'
  get '/sessions/:id' => 'sessions#destroy'
end
