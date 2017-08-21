Rails.application.routes.draw do
  devise_for :users
  resources :ticket_type_conferences
  resources :event_users
  resources :ticket_conferences
  resources :tickets do
    get 'createBatch', :on => :collection
    get 'preregister', :on => :collection
    get 'register', :on => :collection
    get 'confirmation', :on => :collection
  end
  resources :conferences
  resources :ticket_types
  resources :events
  root to: "events#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
