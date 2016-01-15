Rails.application.routes.draw do
  resources :ingredients
  resources :styles
  resources :recipes
  resources :chefs
  get 'pages/home'

  get '/home', to: 'pages#home'
  root 'pages#home'
end
