Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  match '/meetings/endmeeting' =>  'meetings#endmeeting', :via => [:get], :as => :endmeeting
  match '/meetings/continue' =>  'meetings#continue', :via => [:get], :as => :continue_meeting
  match '/templates/create' => 'templates#create', :via => :post
  post '/attendees/update' => 'attendees#update', :via => :post
  post '/attendees/create' => 'attendees#create', :via => :post
	match '/meetings/toggleattendees' => 'meetings#toggleattendees', :via => [:get], :as => :toggleattendees
	post '/notes/new' => 'notes#create', :via => :post
	match '/meetings/review/:meetingid' => 'meetings#review', :via =>  [:get], :as => :reviewmeeting
	match '/notes/complete/:id' => 'notes#complete', :via => :get, :as => :completenote	
	post '/meetings/setrecallid' => 'meetings#setrecallid', :via => :post
	match '/update_meetingtypes' => 'meetings#update_meetingtypes', :via => :get	
	match '/update_meetingdates' => 'meetings#update_meetingdates', :via => :get
	
  resources :meetings do
    get "delete"
  end

  resources :templates do
    get "delete"
  end

  root 'meetings#index'

  resources :attendees do
    get "delete"
  end 
  
  resources :notes do
    get "delete"
  end  

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
