Rails.application.routes.draw do


  resources :tables do
    post 'add_item/:menu_id' => 'tables#add_item', as: :add_item
    get 'pay'
    post 'stripe'
    get 'finish'
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :manager do
    get 'home/index'
    get 'home/dashboard'
    get 'home/menu'
    resources :cuisines
    resources :restaurants do 
      resources :menus
      resources :restaurant_tables
    end
    devise_for :restaurant_users, path: 'manager', controllers: {
      sessions: 'manager/restaurant_users/sessions',
      registrations: 'manager/restaurant_users/registrations'
    }
  end

  get 'home_mobile/index'
  get 'home/index'
  post 'home/register_table'
  get 'home/register_table/:code' => 'home#register_table', as: :register_table
  post 'home/start_table/:table_id' => "home#start_table", via: [:get, :post], as: :start_table
  get 'home/table'
  post 'home/set_locale/:language_id' => 'home#set_locale', as: :home_set_locale


  root 'home#index'

end
