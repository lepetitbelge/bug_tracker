Rails.application.routes.draw do
  root to: 'pages#home'

  resources :bugs, only: [:index, :new, :show, :create]
end
