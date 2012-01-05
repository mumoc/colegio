Colegio::Application.routes.draw do
  
  namespace :admin do
    root to: 'events#index'
    resources :events
  end
end
