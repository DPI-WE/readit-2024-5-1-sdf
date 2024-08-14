Rails.application.routes.draw do
  draw(:admin)
  draw(:pwa)

  devise_for :users
  resources :comments
  resources :dashboard, only: [:index]
  resources :posts do
    get 'export', on: :collection
  end

  root 'posts#index'
end
