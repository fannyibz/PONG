Rails.application.routes.draw do
  devise_for :users
  
  root to: 'pages#home'

  resources :events do
    #CREATING ROUTES FOR THE SIMPLE_FORM CREATION OF AN EVENT
    member do
      get :edit_what
      patch :update_what
      get :edit_address
      patch :update_address
      get :edit_when
      patch :update_when
      get :edit_friends
      patch :update_friends
    end
  end
end
