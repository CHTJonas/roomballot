Rails.application.routes.draw do
  root :to => 'high_voltage/pages#show', id: 'home'
  resources :rooms
  resources :houses
  resources :groups
  resources :users  
end
