Rails.application.routes.draw do
  get 'card/new'
  get 'card/create'
  # get 'list/new'
  # get 'list/create'
  
  # devise_for :users, controllers: {
  #   sessions: 'devise/sessions',
  #   registrations: 'devise/registrations'
  # }
  devise_for :users
  root 'top#index'
  devise_scope :user do
   get '/users' => 'devise/registrations#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :list, only: %i(new create edit update destroy) do
    # resources :card, only: %i(new create show edit update destroy)
    resources :card, except: %i(index)
  end
  
end
