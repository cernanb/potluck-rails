Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'events#index'

  resources :events do 
    resources :dishes, only: [:create]
  end
  resources :event_dishes, only: [:update]
end
