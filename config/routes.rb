Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
  resources :users
  resources :tracks
  resources :playlists
  get '/soundcloud/connect', to: 'soundcloud#connect'
  get 'soundcloud/oauth-callback', to: 'soundcloud#connected'
  get '/soundcloud/status', to: 'soundcloud#status', as: 'status'
  get '/soundcloud/sync', to: 'soundcloud#sync', as: 'soundcloud_sync'
  get '/soundcloud/disconnect', to: 'soundcloud#destroy', as: 'soundcloud_disconnect'
end
