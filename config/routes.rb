Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails
  resources :alcohols, only: [:index, :show] 
  resources :garnishes, only: [:index, :show] 
  resources :mixers, only: [:index, :show] 
  resources :users
  resources :cocktails, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
end
