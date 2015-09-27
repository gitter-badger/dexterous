require "que/web"

Dexterous::Application.routes.draw do

  resources :participants
  root 'home#index'
  get 'dashboard' => 'home#dashboard'
  get 'tracks/:id/timeline' => 'tracks#timeline'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letters'
  end

  mount Que::Web => '/que'

  resources :learning_resources
  resources :milestones
  resources :achievements
  resources :enrollments

  resources(:tracks) { resources :milestones }
  resources(:milestones) { resources :learning_resources }
  resources(:learning_resources)

  devise_for :users, controllers: { registrations: 'registrations' }

  # resources :users do
  #   get 'tracks/:critaria' => 'tracks#index'
  # end

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
