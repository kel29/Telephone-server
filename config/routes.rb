Rails.application.routes.draw do
  resources :game_rounds, only: [:index, :create]
  resources :games, only: [:index, :create, :show]
  resources :users, only: [:index, :create, :update, :show]
end
