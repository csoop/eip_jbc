Rails.application.routes.draw do

  root to: "page#welcome"
  get "login" => "users#login", :as => "login"
  get "register" => "users#register", :as => "register"
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"

  resources :users, only: [:create]
  resources :viewimages

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  get '/calendar' => 'page#calendar'
  get '/userweb' => 'usercars#index', :as => "userwebs"
  get '/userlogin' => 'usercars#login', :as => "userlogin"
  get '/detail' => 'usercars#detail', :as => "detail"
  get '/orders' => 'carts#orders'
  get '/order' => 'usercars#order'
  get '/exports' => 'carts#exports', :as => "exports"
  get '/inspect' => 'usercars#inspect' 
  get '/upload' => 'usercars#upload'
  get '/usercars/:id' => 'usercars#show', :as => "usercar"
  delete 'usercars_logout' => 'usercars#logout', :as => "usercars_logout"
  post 'usercars' => "usercars#create", :as => "usercars"
  get '/history' => 'usercars#history', :as => "history"

  get '/order_audit' => 'buyers#order_audit', :as => "order_audit"
  resources :buyers, only: [:create, :show, :new, :edit, :destroy] do
    resources :pictures
  end

  # update多个操作使用了post
  # post '/cart_update' => "cart_items#update", :as => "cart_update"
  post '/size_groups' => "size_groups#update", :as => "size_update"

  resources :carts
  resources :cart_items

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
