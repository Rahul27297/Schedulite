Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
    
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/courses')
  get    '/prevcoursesform' => 'courses#prevcoursesform', via: :all
  get    '/updatedcourses(.:format)' => 'courses#updatedcourses', as: :updatedcourses
  get    '/courses(.:format)' => 'courses#index', as: :courses
  get    '/courses/:id(.:format)' => 'courses#show', as: :course_detail
  post   '/course/ans/:id(.:format)' => 'courses#add_ans', as: :course_ans
  post   '/course/faq/:id(.:format)' => 'courses#add_faq', as: :course_faq
  post   '/courses/addcart(.:format)' => 'courses#add_to_cart', as: :courses_add_cart

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
