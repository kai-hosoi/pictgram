Rails.application.routes.draw do

  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  get 'pages/link'
  
  resources :users
  resources :topics do
    resources :comments ,only: [:create]
  end
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get 'comments/index'
  get 'comments/new'
  post '/comments', to: 'comments#create'

  
end
