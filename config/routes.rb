Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  get :components, to: 'pages#components'
  get 'dashboard', to: 'pages#dashboard'
  get 'users_list', to: 'pages#users_list'

  resources :event_users, only: [] do
    member do
      get :confirm
      get :decline
    end
  end

  resources :events do
    #CREATING ROUTES FOR THE SIMPLE_FORM CREATION OF AN EVENT
    resources :messages, only: :create
    member do
      get :edit_what
      patch :update_what
      get :edit_address
      patch :update_address
      get :edit_when
      patch :update_when
      get :edit_friends
      patch :update_friends
      get :chatroom
    end
  end

  resources :friendships, only: :create do
    member do
      get :toggle_favorite
    end
  end # to do: rename in friendship_requests
  resources :friendship_acceptances, only: :create


  # resources :friendships, only: [] do
  #   member do
  #     post :accept
  #     get :decline
  #   end
  # end

end

