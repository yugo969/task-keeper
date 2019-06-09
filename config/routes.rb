Rails.application.routes.draw do
  get 'card/new'
  get 'card/create'
  # get 'list/new'
  # get 'list/create'
  devise_for :users
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :list, only: %i(new create edit update destroy) do
    # resources :card, only: %i(new create show edit update destroy)
    resources :card, except: %i(index)
  end
  
end
