Rails.application.routes.draw do
  get 'contributions/new'
  get 'cards/new'
  get 'cards/edit'
  get 'cards/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
