Rails.application.routes.draw do

  root "welcome#index"

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :enrolls
  devise_for :users
  resources :contacts, only: [:new, :create]
  resources :reviews, only: [:new, :create]
  resources :categories, only:[:index, :new, :create, :show, :destroy]
  resources :videos, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :lessons, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sections, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :courses , concerns: :paginatable
  resources :users, only: [:show,:edit, :index, :update]

  resources :courses do
    member do
      patch :publish, to: "courses#publish"
    end
  end

  resources :users do
    member do
      get :admin, to: "users#admin_home"
    end
  end


  get "/users/:id/admin/users", to: "users#admin_users"
  get "/users/:id/admin/courses", to: "users#admin_courses"
  get "/users/:id/admin/reviews", to: "users#admin_reviews"
  get "/users/:id/admin/categories", to: "users#admin_categories"
  get "/users/:id/admin/enrolls", to: "users#admin_enrolls"



  get '/account', to: 'users#account'
  get "/dashboard" ,to: "users#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
