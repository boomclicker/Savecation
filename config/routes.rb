Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users

  root to: 'creatives#index'
  get 'cities/index'
  # get 'creatives/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
