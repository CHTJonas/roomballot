Rails.application.routes.draw do
  root :to => 'high_voltage/pages#show', id: 'home'

  resources :rooms

  resources :houses do
    resources :reviews
  end

  resources :ballot_groups do
    get 'order', on: :collection
    get 'join', on: :member
  end

  resources :news_items

  resources :timetable_items

  resources :users

  get '/auth/:provider/callback' => 'sessions#create', as: :auth_callback
  get '/login' => 'sessions#new', as: :signin
  get '/logout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure', as: :auth_failure
end
