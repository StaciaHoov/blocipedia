Rails.application.routes.draw do
  
  devise_for :users 
  
  resources :users, only: [:update, :show]
  
  root to: 'welcome#index'

  get 'about' => 'welcome#about'
  
  resources :wikis
  
  resources :charges, only: [:new, :create]
  
end
