Rails.application.routes.draw do
  # pages crud
  root "page#home"
  get '/about', to: "page#about"
  
  #users crud
  resources :users

  # sessions crud
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # survey crud
  resources :surveys do 
    get 'display_for_user', to: 'surveys#all_user_surveys'
  end
  
  # question crud
  resources :questions

  # answer crud
  resources :answers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
