Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}

  root 'dummy_page#index'
  get 'dummy_page/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
