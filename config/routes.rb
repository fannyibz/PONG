Rails.application.routes.draw do
  devise_for :users
  
  root to: 'pages#home'
  get :components, to: 'pages#components'
  resources :events
end
