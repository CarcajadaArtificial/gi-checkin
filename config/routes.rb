Rails.application.routes.draw do
  resources :tickets, except: [:index, :new, :edit, :destroy] do
#    get 'createBatch',          :on => :collection
    get 'preregister',          :on => :collection, as: :preregister
    get 'preregister2',         :on => :collection, as: :preregister2
    get 'impulso',              :on => :collection, as: :impulso
    get 'edifica',              :on => :collection, as: :edifica
    get 'register',             :on => :collection, as: :register
    get 'register_conference',  :on => :collection, as: :register_conference
    get 'confirmation',         :on => :collection
    get 'esm_875678545678',     :on => :collection, as: :esm_dashboard
    get 'mkt_dashboard',        :on => :collection, as: :mkt_dashboard
  end
  resources :conferences, except: [:index, :show, :new, :edit, :destroy]
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
