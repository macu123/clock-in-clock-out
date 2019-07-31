Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :clock_events, only: [:edit, :update, :destroy] do
    member do
      post :checkin
      post :checkout
    end
  end
end
