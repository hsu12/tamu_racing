Rails.application.routes.draw do
  get 'orders/new'

  get 'orders/update'
  post 'orders/update'
  get 'orders/create'

  get 'orders/index'

  get 'orders/show'

  #get 'orders/new'
  resources :products, only: [:index,:destroy,:new,:create]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :widgets
  resources :widgets
  resources :articles
  resources :orders
  mount Ckeditor::Engine => '/ckeditor'
  #get 'sessions/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  
  root 'home#home'
  get 'unauthorizePage', to: 'home#unauthorized'
  get 'video', to: 'gallery#video'
  get 'picture', to: 'gallery#picture'
  get 'about', to: 'about#about'
  get 'store', to: 'products#index'
  get 'display', to: 'articles#display'
  
  resources :users, except: [:new]
  get 'signup' , to: 'users#new'
  get 'done', to: 'users#done'
  get 'item', to: 'products#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :applies
   resources :applyas
  get 'checkProgress', to: 'users#checkProgress'
  get 'switchStatus', to: 'users#flipStatus'

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
