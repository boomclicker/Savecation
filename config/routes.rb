Rails.application.routes.draw do

  get 'import/index'

  resources :triplaces do
    collection {post :import}
  end
  resources :cities

  # cities api routes
  get 'data/cities'
  get 'data/city/:id', to: 'data#city'

  # attraction api routes
  get 'data/attraction/:id', to: 'data#attraction'

  # city page routes
  get 'city_detail/:id', to: 'city_detail#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users

  root to: 'creatives#index'
end
