Rails.application.routes.draw do
  #get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
