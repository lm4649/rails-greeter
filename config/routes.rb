Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cards, only: [:new, :create, :show, :edit, :update] do
    resources :contributions, only: [:new, :create]
  end
  resources :contributions, only: [:show, :update]
  get '/dashboard', to:'users#dashboard'

  resources :cards, only: :show
  get '/cards/:id/preview', to: "cards#preview", as: :card_preview
  get '/cards/:id/send', to: "cards#send_card", as: :send_card

end
