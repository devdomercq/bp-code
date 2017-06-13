Rails.application.routes.draw do
  
  resources :scoreboards
  root 'scoreboards#index'
  
end
