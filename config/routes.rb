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

  get '/events/:event_id/sessions/:id/book' =>
      'sessions#book',
      as: 'book_event_session'
  # get '/events/:event_id/sessions/:id/book' =>
  #     'sessions#book',
  #     as: 'book_event_session'

  resources :crafters
  resources :craftees
  resources :events do
    resources :sessions
  end

  # Craftee

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
