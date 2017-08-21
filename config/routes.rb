
Rails.application.routes.draw do
  resources :tickets, except: [:index, :destroy, :edit] do
    get 'createBatch', :on => :collection
    get 'preregister', :on => :collection
    get 'register', :on => :collection
    get 'confirmation', :on => :collection
  end
  resources :conferences, except: [:index, :edit, :destroy]
  resources :ticket_types, except: [:index]
  resources :events do
    get 'mktfest', :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tickets#preregister"
end
