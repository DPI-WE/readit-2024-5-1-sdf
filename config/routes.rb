Rails.application.routes.draw do
  draw(:admin)

  devise_for :users
  resources :comments
  resources :dashboard, only: [:index]
  resources :posts do
    get 'export', on: :collection
  end

  root 'posts#index'
end
