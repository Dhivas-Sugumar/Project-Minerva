Rails.application.routes.draw do

  root "welcome#index"

  resources :enrolls, only: [:show,:destroy,:new,:create,:index]
  devise_for :users
  resources :reviews
  resources :categories
  resources :videos
  resources :lessons
  resources :sections
  resources :courses
  resources :users


  get '/account', to: 'users#account'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
