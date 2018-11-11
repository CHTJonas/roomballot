Rails.application.routes.draw do
  root :to => 'high_voltage/pages#show', id: 'home'
  resources :rooms
  resources :houses do
    resources :reviews
  end
  resources :groups
  resources :users

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new', :as => :signin
  get '/logout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
