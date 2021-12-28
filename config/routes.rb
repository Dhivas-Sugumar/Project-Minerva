Rails.application.routes.draw do
  resources :categories
  resources :videos
  resources :lessons
  resources :sections
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "videos#index"
end
