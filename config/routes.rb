Rails.application.routes.draw do


  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  namespace :admin do

    resources :restaurants do 
      resources :menus
    end
    resources :cuisines

    devise_for :restaurant_users, controllers: {
      sessions: 'admin/restaurant_users/sessions',
      registrations: 'admin/restaurant_users/registrations'
    }
    get 'home/index'
    get 'home/restaurant_user_authenticated'



  end



  get 'home_mobile/index'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

end
