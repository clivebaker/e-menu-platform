# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :restaurant do
    get 'list' => "home#index"
    get 'booking/:slug' => "booking#index", as: :booking
    get 'menu/:slug' => "menu#index", as: :menu
  end



  resources :tables do
    post 'add_item/:menu_id' => 'tables#add_item', as: :add_item
    get 'pay'
    post 'stripe'
    get 'finish'
    get 'sectioned_menus'
    get 'sectioned_menus/:menu_id' => 'tables#sectioned_menus', as: 'sectioned_menus_choice'

  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      get 'menu/:id' => 'menu#index'
      get 'menu_item/:id', to: 'menu#menu_item'
      get 'menu_optionals', to: 'menu#menu_optionals'
      get 'menu_optionals/:items', to: 'menu#menu_optionals'
    end
  end

  

  namespace :manager do
    get 'home/index'
    get 'home/dashboard'
    get 'home/menu'

    get 'live_tables/:restaurant_id' => 'live#tables', as: :live_tables
    get 'live_items/:restaurant_id' => 'live#items', as: :live_items
    get 'service/:restaurant_id/item/:table_item_id' => 'live#service', as: :live_service

    resources :features
      

    resources :packages do
      post 'add_feature/:feature_id', action: :add_feature, as: :add_feature
      post 'remove_feature/:feature_id', action: :remove_feature, as: :remove_feature
    end

    resources :cuisines
    resources :restaurants do
      post 'add_feature/:feature_id', action: :add_feature, as: :add_feature
      post 'remove_feature/:feature_id', action: :remove_feature, as: :remove_feature
      get 'active', action: :active
      post 'toggle_active', action: :toggle_active


      resources :menus
      resources :restaurant_tables do
        collection do
          get :qr
        end
      end
      resources :custom_lists do 
        resources :custom_list_items
      end
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
  post 'home/start_table/:table_id' => 'home#start_table', via: %i[get post], as: :start_table
  get 'home/table'
  post 'home/set_locale/:language_id' => 'home#set_locale', as: :home_set_locale

  root 'home#index'
end
