Rails.application.routes.draw do
  
  devise_for :users
  resources :scoreboards
  root 'scoreboards#index'
  
end
