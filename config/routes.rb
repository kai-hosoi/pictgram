Rails.application.routes.draw do
  
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  get 'pages/link'
  
  resources :users
  resources :topics
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
