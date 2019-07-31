Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
