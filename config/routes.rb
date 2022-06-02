Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: 'homes#top'
  resources :schedules
  resources :groups, only: [:new, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
