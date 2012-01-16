Colegio::Application.routes.draw do
  devise_for :members

  root to: 'home#index'

  match '/calendar/day/:event_date' => 'calendar#show', :as => 'day_events'
  
  match '/events/category/:event_type' => 'events#index'
  match '/event_dates/:event_type' => 'event_dates#index'
  
  match '/colegio/:id' => 'static#show'
  match '/industria' => 'static#show', id: 'industria'
  match '/contacto' => 'static#show', id: 'contacto'
  
  match 'public_contact' => 'contact#public_contact', :as => 'public_contact', :via => :post

  resources :events
  resources :members
  resources :calendar 
  resources :contact

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :members
    resources :adresses
    resources :banners
  end
end
