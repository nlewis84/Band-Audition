Rails.application.routes.draw do
  resources :players
  resources :audition_users
  resources :auditions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
