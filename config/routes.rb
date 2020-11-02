Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"
  resources :pokemons, only: [:index]
  post 'pokemons/upload', to:'pokemons#upload'
  post 'pokemons/destroy_all', to: 'pokemons#destroy_all'
end
