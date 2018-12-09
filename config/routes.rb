Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :manager do
    get 'home/index'
    get 'home/dashboard'
    get 'home/menu'
    resources :cuisines
    resources :restaurants do 
      resources :menus
      resources :tables
    end
    devise_for :restaurant_users, path: 'manager', controllers: {
      sessions: 'manager/restaurant_users/sessions',
      registrations: 'manager/restaurant_users/registrations'
    }
  end

  get 'home_mobile/index'
  get 'home/index'

  root 'home#index'

end
