Colegio::Application.routes.draw do
  root to: 'home#index'
  match '/events/:event_type' => 'events#index'
  
  resources :events
  resources :members

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :members
    resources :adresses
  end
end
