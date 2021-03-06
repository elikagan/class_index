Rails.application.routes.draw do
  
  

  root 'bubbles#index'

  get 'sessions/create'

  get 'sessions/new'

  get 'sessions/destroy'

  get 'bubbles/upvote' => 'bubbles#upvote', as: :upvote
  get 'bubbles/downvote' => 'bubbles#downvote', as: :downvote

  get 'comments/upvotecomment' => 'comments#upvotecomment', as: :upvotecomment
  get 'comments/downvotecomment' => 'comments#downvotecomment', as: :downvotecomment


  resources :bubbles do
    member do
    end


  resources :comments
  end

  resources :users, except: [:destroy]
  resource :sessions, only: [:create, :new, :destroy]


  get 'tag_search/index' => 'tag_search#index', as: :tag_search

  get 'tag_search/find' => 'tag_search#find', as: :find


  

  




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
