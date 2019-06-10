Rails.application.routes.draw do
  post '/performers/records/add', to: "records#create"
  get '/performers/records/delete', to: "records#destroy"
  post "/playlists/subscriptions/add", to: "subscriptions#create"
  get "/playlists/subscriptions/delete", to: "subscriptions#destroy"
  post "/performers/add_song", to: "performers#add_song"
  get "/performers/destroy_song", to: "performers#destroy_song"
  post "/performers/add_album", to: "performers#add_album"
  get "/performers/destroy_album", to: "performers#destroy_album"
  post "/albums/add_song", to: "albums#add_song"
  get "/albums/destroy_song", to: "albums#destroy_song"

  post "/songs/addToLiked", to: "songs#addToLiked"
  post "/songs/dislike", to: "songs#dislike"
  get "/search", to: "search#index"

  resources :subscriptions
  resources :performers
  resources :songs
  resources :playlists
  resources :albums
  resources :search
  get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to:'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
