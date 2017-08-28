
Rails.application.routes.draw do
  resources :tickets, except: [:index, :destroy, :edit] do
    # get 'createBatch', :on => :collection
    get 'preregister', :on => :collection
    get 'register', :on => :collection
    get 'confirmation', :on => :collection
  end
  resources :conferences, except: [:index, :edit, :destroy]
  resources :ticket_types, except: [:index, :show, :new, :edit, :destroy]
  resources :events, except: [:index, :show, :new, :edit, :destroy] do
    get 'mktfest', :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => redirect("http://www.checkn.mx/")
end
