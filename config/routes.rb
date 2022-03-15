Rails.application.routes.draw do

  root "welcome#index"

  resources :enrolls, only: [:show,:destroy,:new,:create, :index]
  devise_for :users
  resources :contacts, only: [:new, :create]
  resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :categories, only:[:index, :new, :create, :show, :destroy]
  resources :videos, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :lessons, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sections, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :courses
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]


  get '/account', to: 'users#account'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
