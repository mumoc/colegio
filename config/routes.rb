Colegio::Application.routes.draw do
  devise_for :members

  root to: 'home#index'

  match '/calendario/dia/:event_date' => 'calendar#show', :as => 'day_events'
  
  match '/eventos/categoria/:event_type' => 'events#index', as: 'category_events'
  match '/event_dates/:event_type' => 'event_dates#index'
  
  match '/colegio/:id' => 'static#show', as: 'colege'
  match '/industria' => 'static#show', id: 'industria', as: 'industry'
  match '/contacto' => 'static#show', id: 'contacto', as: 'contact'
  
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

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
