Rails.application.routes.draw do

  # Doorkeeper required endpoint (For authentication, creating api key, etc)
  use_doorkeeper

  # API, Mounting Grape
  mount Api => '/api'

  devise_for :users, controllers: { registrations: 'registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

  # resources :kids do
  #  resources :favorites
  #  resources :movies do
  #      collection { post :search, to: 'movies#index' }
  #  end
  #  resources :books do
  #    collection { post :search, to: 'books#index' }
  #  end
  #  resources :foods, :drinks
  # end

  resources :invites do
    member do
      post :accept, to: 'invites#accept', as: :accept
      post :cancel, to: 'invites#cancel', as: :cancel
      post :reject, to: 'invites#reject', as: :reject
    end
  end

  resources :users, only: :show
  resources :sits do
    resources :sitrequests do
      member do
        post :accept, to: 'sitrequests#accept', as: :accept
        post :cancel, to: 'sitrequests#cancel', as: :cancel
        post :reject, to: 'sitrequests#reject', as: :reject
      end
    end
  end
  

  resources :families
  resources :kids do
    resources :favorites
    resources :movies do
      collection { post :search, to: 'movies#index' }
    end
    resources :books do
      collection { post :search, to: 'books#index' }
    end
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
