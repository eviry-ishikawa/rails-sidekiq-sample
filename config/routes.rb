Rails.application.routes.draw do
  resources :pokemons, only: [:index]
  post 'pokemons/upload', to:'pokemons#upload'
  post 'pokemons/destroy_all', to: 'pokemons#destroy_all'
end
