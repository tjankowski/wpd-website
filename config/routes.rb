# -*- encoding : utf-8 -*-
WpdWebsite::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  resources :users

  resources :session

  resources :categories, :has_many => :products, :collection => {:name_auto_complete => :get, :sort_menu => :post, :sort_products => :post }, :as => 'oferta'

  resources :photos

  resources :pages, :member => { :preview => :get }

  resources :products, :has_many => :photos,  :collection => {:sort_photos => :post}, :as => 'pomoce_dydaktyczne'

  match '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  match '/signup' => 'users#new', :as => 'signup'

  match '/login' => 'sessions#new', :as => 'login'

  match '/logout' => 'sessions#destroy', :as => 'logout'

  match '/search' => 'search#index', :as => 'search'

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'site#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match ':controller(/:action(/:id))(.:format)'
end
