Rails.application.routes.draw do
  devise_for :users
  root 'auctions#index'
  resources :auctions do
    resources :bids, only: [:create, :index]
    resources :publishings, only: :create
    resources :watches, only: [:create, :destroy]
  end
end
