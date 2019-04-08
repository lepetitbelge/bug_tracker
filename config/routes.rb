Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :bugs, only: [:index, :new, :show, :create]
end
