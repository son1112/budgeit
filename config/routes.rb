Rails.application.routes.draw do
  resources :transactions
  resources :accounts
  resources :messages
  resources :users
  resources :conversations

  post '/call', to: 'conversations#call'
end
