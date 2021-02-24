Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/join' => 'auditions#join'
  post '/join' => 'auditions#code'
  get '/auditions/:audition_id/players/total' => 'players#total', as: :total

  resources :users, only: [:show] do
    resources :auditions, only: [:show, :index, :create, :edit, :update]
  end

  resources :auditions, only: [:new] do
    resources :players, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :instruments, only: [:edit, :update]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
