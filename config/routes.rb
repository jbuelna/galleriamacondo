ActionController::Routing::Routes.draw do |map|
  map.resources :artists, :has_many => :comments
  map.resources :paintings, :has_many => :comments
  map.resources :media
  map.resources :locations
  map.resources :comments

  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.connect 'about', :controller => 'about', :action => 'index'
  map.connect 'admin', :controller => 'admin/Home', :action => 'index'  

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
  map.resource :admin do |admin| 
    admin.resources :artists, :name_prefix => 'admin_' 
    admin.resources :paintings, :name_prefix => 'admin_' 
    admin.resources :media, :name_prefix => 'admin_' 
    admin.resources :locations, :name_prefix => 'admin_' 
  end 
  

  map.resources :gallery, :member => { :delete => :get }

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.connect '', :controller => "gallery"
  map.home '', :controller => "gallery"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
