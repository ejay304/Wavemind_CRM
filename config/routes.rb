WavemindCrm::Application.routes.draw do

  resources :task_types

  resources :document_types

  resources :activity_states

  resources :images

  resources :projects do
    resources :activities do
      resources :tasks
      resources :documents do
        collection do
          get 'validate', to: 'documents#validate'
        end
      end
    end
  end

  resources :companies do 
    resources :contacts, controller: 'users', type: 'Contact' do

      member do
        get 'myProjects/', to: 'projects#myProjects'
      end
    end  
  end

  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :employees , type: 'Employee', :controllers => { :registrations => "employees/registrations" }
  devise_for :contacts, type: 'Contact' 
  resources :employees, controller: 'users', type: 'Employee' 
  resources :users


  get '/dropbox/authorize'   => 'dropbox#authorize'  , :as => :dropbox_auth
  get '/dropbox/callback' => 'dropbox#callback'  , :as =>  :dropbox_callback

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'projects#index'

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
