Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/random', to: 'merchants#random'
      get '/merchants/find', to: 'merchants#search'
      get '/merchants/find_all', to: 'merchants#search_all'
      resources :merchants, only: [:show] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      get '/customers/random', to: 'customers#random'
      get '/customers/search', to: 'customers#search'
      resources :customers, only: [:show]

      get '/items/random', to: 'items#random'
      get '/items/search', to: 'items#search'
      resources :items, only: [:show]

      get '/invoices/random', to: 'invoices#random'
      get '/invoices/search', to: 'invoices#search'
      resources :invoices, only: [:show] do
        resources :items, only: [:index]
      end

      get '/invoice_items/random', to: 'invoice_items#random'
      get '/invoice_items/search', to: 'invoice_items#search'
      resources :invoice_items, only: [:show]

      get '/transactions/random', to: 'transactions#random'
      get '/transactions/search', to: 'transactions#search'
      resources :transactions, only: [:show]
    end
  end
end
