Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  devise_for :web_admins
  namespace :web_admin do 
    resources :dashboards 
    resources :schools 
    resources :profiles do
      member do
        get :change_password 
        put :reset_password
        put :reset_email
      end
    end
  end
  namespace :admin do 
    resources :students do
      get :assign_subject
      member do
        get :assign_class
        post :assign_teacherclass
      end
    end 
    resources :attendances do 
      collection do
        get :add_edit
      end
      member do
        get :list
      end
    end
    resources :dashboards 
    resources :batches
    resources :marks do 
      collection do
        get :subject_model
        post :create_test
        get :list
      end
      member do
        get :test_name
        get :add_edit
      end
    end
    
    resources :profiles do
      member do
        get :change_password
        put :reset_password
      end
    end
  end 
  resources :homes 
  resources :users do
    member do
      get :change_password 
       put :reset_password
    end
  end
  root 'homes#index'
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
