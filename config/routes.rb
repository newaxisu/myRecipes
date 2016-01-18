Rails.application.routes.draw do
  resources :reviews
  #resources :likes
  resources :ingredients
  resources :styles
  resources :recipes do
    member do
      post 'like'
    end
  end
  
  resources :chefs, except: [:new]
  
  
  get '/register', to: 'chefs#new'
  
  get 'pages/home'

  get '/home', to: 'pages#home'
  root 'pages#home'
  
  get  '/login',  to: "logins#new"
  post '/login',  to: "logins#create"
  get  '/logout', to: "logins#destroy"
end
