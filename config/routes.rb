Rails.application.routes.draw do

  root "welcome#index"

  resources :enrolls
  devise_for :users
  resources :reviews
  resources :categories
  resources :videos
  resources :lessons
  resources :sections
  resources :courses
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
