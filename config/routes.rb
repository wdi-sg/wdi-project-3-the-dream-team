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

  resources :crafters
  resources :craftees do
    post '/fav_events', to: 'fav_events#create', as: 'fav_event'

  end
  resources :events do
    resources :sessions
    resources :bookings
  end

  # Craftee

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
