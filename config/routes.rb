Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'about' => 'welcome#about'
  
  devise_for :users 
  
  resources :users, only: [:update, :show]

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end
  
  resources :charges, only: [:new, :create]
  
end
