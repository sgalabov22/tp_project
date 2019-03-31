Rails.application.routes.draw do
  post "/playlists/subscriptions/add", to: "subscriptions#create"
  get "/playlists/subscriptions/delete", to: "subscriptions#destroy"
  resources :subscriptions
  resources :songs
  resources :playlists
  get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to:'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
