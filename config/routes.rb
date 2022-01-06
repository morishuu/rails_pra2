Rails.application.routes.draw do

  
  root to: 'home#index'
  get 'home/index'
  devise_for :users
  get 'bookings/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/index'
  get 'users/show'
  resources :users
end
