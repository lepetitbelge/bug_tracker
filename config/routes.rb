Rails.application.routes.draw do
  root to: 'pages#home'

  resources :bugs, only: [:index, :show]
  # resources :cocktails do
  #     resources :doses, only: [:new, :create]
  #   end

  #   resources :doses, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
