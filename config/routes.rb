Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  devise_for :users
  root to: 'schedules#index'
  resources :schedules
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
