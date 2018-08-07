Rails.application.routes.draw do
  get 'home/index'
  get 'home/resturant_user_index'
  get 'home/user_index'
  devise_for :resturant_users, controllers: {
    sessions: 'resturant_users/sessions',
    registrations: 'resturant_users/registrations'
  }

  resources :resturants
  resources :cuisines
  get 'home/index'
  get 'home/resturant_user_index'
  get 'home/resturant_user_authenticated'
  get 'home/user_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

end
