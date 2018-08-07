Rails.application.routes.draw do
  resources :restaurants
  get 'home/index'
  get 'home/restaurant_user_index'
  get 'home/user_index'
  devise_for :restaurant_users, controllers: {
    sessions: 'restaurant_users/sessions',
    registrations: 'restaurant_users/registrations'
  }

  resources :restaurants
  resources :cuisines
  get 'home/index'
  get 'home/restaurant_user_index'
  get 'home/restaurant_user_authenticated'
  get 'home/user_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

end
