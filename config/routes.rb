Rails.application.routes.draw do
  resources :availabilities

  resources :lessons

  devise_for :learners, controllers: { registrations: "learners/registrations" }
  resources :learners do
    member do
      get '/schools' => 'learners#add_school', as: :add_school
      post '/schools' => 'learners#update_add_school', as: :update_add_school
    end
  end
# root :to => 'home#index'
root :to => 'home#index_test'
get '/about_us' => 'home#about_us', as: :about_us



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :teachers, controllers: { registrations: "teachers/registrations" }

  resources :schools do
    get '/dashboard' => 'schools#dashboard', as: :dashboard
    get '/teachers' => 'schools#add_teachers', as: :add_contract
    post '/teachers' => 'schools#create_contract', as: :create_contract
  end


  resources :teachers do

    get '/teachers' => 'teachers#add_availability', as: :add_availability
      get '/history' => 'teachers#history', as: :history



      resources :lessons, only: [:create]
  end



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
