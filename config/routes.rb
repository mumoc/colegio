Colegio::Application.routes.draw do
  root to: 'home#index'
  match '/home/download' => 'home#download'
  match '/calendar/day/:event_date' => 'calendar#show', :as => 'day_events'
  match '/events/category/:event_type' => 'events#index'
  match '/event_dates/:event_type' => 'event_dates#index'
  match '/colegio/:id' => 'static#show'
  match '/industria' => 'static#show', id: 'industria'
  resources :events
  resources :members
  resources :calendar 

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :members
    resources :adresses
    resources :banners
  end
end
