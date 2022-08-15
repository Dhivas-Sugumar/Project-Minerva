Rails.application.routes.draw do

  root "welcome#index"

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :enrolls, only: [:new, :create, :edit, :update, :destroy]
  devise_for :users
  resources :contacts, only: [:new, :create]
  resources :reviews, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :categories
  resources :videos, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :lessons, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sections, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :courses , concerns: :paginatable
  resources :users, only: [:show,:edit, :index, :update]

  resources :courses do
    member do
      patch :publish, to: "courses#publish"
      post :enroll, to: "courses#enroll"
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

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
