Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :instruments
  resources :players
  resources :audition_users
  resources :auditions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
