Rails.application.routes.draw do

  
  get 'resarvations/index'
  post 'resarvations/back'
  post 'resarvations/confirm'
  post 'resarvations/complete'
  root to: 'home#index'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/index'
  get 'users/show'

  resources :users
  resources :bookings
  resources :resarvations

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
