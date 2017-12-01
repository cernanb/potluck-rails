Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'static#home'
  post '/sessions', to: 'sessions#create'

  get '/login', to: 'sessions#new'

  resources :events do 
    resources :dishes, only: [:create, :destroy]
  end

  resources :comments, only: [:create]
  resources :event_dishes, only: [:update]

  resources :users, only: [:new, :create]
end
