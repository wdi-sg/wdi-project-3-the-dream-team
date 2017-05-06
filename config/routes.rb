Rails.application.routes.draw do
  get 'bookings/index'

  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/edit'

  get 'bookings/update'

  get 'bookings/destroy'

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
  resources :craftees
  resources :events do
    resources :sessions
    resources :bookings
  end

  # Craftee

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
