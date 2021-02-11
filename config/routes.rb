Rails.application.routes.draw do

  resources :audition_instruments
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/join' => 'auditions#join'
  post '/join' => 'auditions#update'


  resources :users, only: [:show] do
    resources :auditions, only: [:show, :index, :new, :create]
  end

  resources :auditions, only: [:new]
  resources :instruments
  resources :players
  resources :audition_users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
