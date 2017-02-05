Rails.application.routes.draw do
  
  
##########################################################################################  
################################메인화면 관련#############################################
##########################################################################################
  root  'home#page_main'
  get   'home/page_main'
  # get   'home/linetalk_write'
  post  'home/page_main_linetalk_write'
  
  get   'home/page_announce'
  get   'home/page_price'
  
##########################################################################################  
##############################자유게시판 관련#############################################
##########################################################################################
  
  get   'home/page_board_free'
  get   'home/page_board_free_write'
  post  'home/page_board_free_write_save'
  get   'home/page_board_free_detail/:post_id' => "home#page_board_free_detail"
  post  'home/page_board_free_update/:post_id' => "home#page_board_free_update"
  post  'home/page_board_free_delete/:post_id' => "home#page_board_free_delete"
  post  'home/page_board_free_update_save/:post_id' => "home#page_board_free_update_save"
  post  'home/page_board_free_reply_save'
  
  
##########################################################################################  
################################리뷰게시판 관련###########################################
##########################################################################################
  
  get   'home/page_board_review'
  get   'home/page_board_review_write'
  post  'home/page_board_review_write_save'
  get   'home/page_board_review_detail/:post_id' => "home#page_board_review_detail"
  post  'home/page_board_review_update/:post_id' => "home#page_board_review_update"
  post  'home/page_board_review_delete/:post_id' => "home#page_board_review_delete"
  post  'home/page_board_review_update_save/:post_id' => "home#page_board_review_update_save"
  post  'home/page_board_review_reply_save'
  


  
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
