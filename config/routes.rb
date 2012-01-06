Colegio::Application.routes.draw do
  root to: 'events#index'
  
  resources :events
  resources :coordinators

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :coordinators
    resources :adresses
  end
end
