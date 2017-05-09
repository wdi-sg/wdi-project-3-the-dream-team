Rails.application.routes.draw do


  resources :meetings
  # devise_for :users, controllers: {sessions: 'users/sessions'}

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # Crafter routes
  # get 'crafters/index'
  # get 'crafters/new'
  # get 'crafters/create'
  # get 'crafters/edit'
  # get 'crafters/update'
  # get 'crafters/destroy'
  root 'pages#index'
  get '/' => 'pages#index'
  get '/pages/switch'
  get 'about' => 'pages#about'
  get '/portfolios' => 'portfolio_items#all_portfolios'
  get '/crafters/:id/events' => 'events#my_events'



  resources :craftees do
    post '/fav_events', to: 'fav_events#create', as: 'fav_event'
  end

  resources :crafters do
    resources :portfolio_items
    resources :events
  end

  get '/filter_events', to: 'events#filter'

  get '/search_events', to: 'events#search'

  resources :events do
    resources :sessions
    resources :bookings
  end

  # Stripe Connect endpoints
  #  - oauth flow
  get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #  - create accounts
  # post '/connect/managed' => 'stripe#managed', as: 'stripe_managed'
  # post '/connect/standalone' => 'stripe#standalone', as: 'stripe_standalone'

  # Stripe webhooks
  post '/hooks/stripe' => 'hooks#stripe'

  # Craftee

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
