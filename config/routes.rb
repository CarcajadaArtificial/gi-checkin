Rails.application.routes.draw do
  devise_for :users
  resources :tickets, except: [:index, :destroy, :edit] do
    # get 'createBatch', :on => :collection
    get 'preregister', :on => :collection, as: :preregister
    get 'preregister2', :on => :collection, as: :preregister2
    get 'register', :on => :collection, as: :register
    get 'confirmation', :on => :collection
  end
  resources :conferences, except: [:index, :edit, :destroy]
  resources :ticket_types, except: [:index, :show, :new, :edit, :destroy]
  resources :events, except: [:index, :show, :new, :edit, :destroy] do
    get 'mktfest', :on => :collection
    get 'ensusmarcas', :on => :collection
  end

  ## devise controllers for users
  devise_for :user, controllers: {
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, skip: [:sessions]

  ## custom routes for users
  as :user do
    get     'register'  => 'users/registrations#new'
    get     'login'     => 'users/sessions#new',      as: :new_user_session
    post    'login'     => 'users/sessions#create',   as: :user_session
    get     'logout'    => 'users/sessions#destroy',  as: :destroy_user_session
  end

  root :to => redirect("http://www.checkn.mx/")
end
