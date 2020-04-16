Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails
  resources :alcohols, only: [:index, :show] 
  resources :garnishes, only: [:index, :show] 
  resources :mixers, only: [:index, :show] 
  resources :users
  resources :cocktails, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
    # login functionality - sessions
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
    post "sessions", to: "sessions#create", as: "sessions"
    delete "sessions", to: "sessions#destroy"
end
