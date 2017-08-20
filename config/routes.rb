Rails.application.routes.draw do
  resources :ticket_type_conferences
  resources :event_users
  resources :ticket_conferences
  resources :tickets do
    get 'createBatch', :on => :collection
    get 'preregister', :on => :collection
    get 'register', :on => :collection
  end
  resources :conferences
  resources :ticket_types
  resources :events
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
