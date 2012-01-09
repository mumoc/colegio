Colegio::Application.routes.draw do
  root to: 'home#index'
  match '/calendar/day/:event_date' => 'calendar#show', :as => 'day_events'
  match '/events/:event_type' => 'events#index'
  match '/event_dates/:event_type' => 'event_dates#index' 
  resources :events
  resources :members
  resources :calendar 

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :members
    resources :adresses
  end
end
