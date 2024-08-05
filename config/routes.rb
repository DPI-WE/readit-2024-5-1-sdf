Rails.application.routes.draw do
  # TODO: only allow admin users
  mount GoodJob::Engine => 'good_job'

  devise_for :users
  resources :comments
  resources :dashboard, only: [:index]
  resources :posts do
    get 'export', on: :collection
  end

  root 'posts#index'
end
