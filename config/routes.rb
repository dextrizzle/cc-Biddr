Rails.application.routes.draw do
  root 'auction#index'
  resources :auctions do
    resources :bids, only: [:create]
  end
end
