Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :bugs, only: %i[index new show create destroy] do
    resoures :fixes, only: %i[create edit destroy]
  end
end
