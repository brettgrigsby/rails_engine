Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/random', to: 'merchants#random'
      get '/merchants/find', to: 'merchants#search'
      get '/merchants/find_all', to: 'merchants#search_all'
      get '/merchants/most_revenue', to: 'merchants#most_revenue'
      get '/merchants/most_items', to: 'merchants#most_items'
      get '/merchants/revenue', to: 'merchants#revenue'
      get '/merchants/:id/revenue', to: 'merchants#merchant_revenue'
      get '/merchants/:id/favorite_customer', to: 'merchants#favorite_customer'
      get '/merchants/:id/customers_with_pending_invoices', to: 'merchants#pending'
      get '/merchants/:id/invoices', to: 'merchants#invoices'
      get '/merchants/:id/items', to: 'merchants#items'
      resources :merchants, only: [:show, :index] do
      end

      get '/customers/random', to: 'customers#random'
      get '/customers/find', to: 'customers#search'
      get '/customers/find_all', to: 'customers#search_all'
      get '/customers/:id/favorite_merchant', to: 'customers#favorite_merchant'
      resources :customers, only: [:show, :index] do
        get '/invoices', to: 'customers#invoices'
        get '/transactions', to: 'customers#transactions'
      end

      get '/items/random', to: 'items#random'
      get '/items/find', to: 'items#search'
      get '/items/find_all', to: 'items#search_all'
      get '/items/most_revenue', to: 'items#most_revenue'
      get '/items/most_items', to: 'items#most_items'
      resources :items, only: [:show, :index] do
        get '/invoice_items', to: 'items#invoice_items'
        get '/merchant', to: 'items#merchant'
      end

      get '/invoices/random', to: 'invoices#random'
      get '/invoices/find', to: 'invoices#search'
      get '/invoices/find_all', to: 'invoices#search_all'
      get '/invoices/:id/invoice_items', to: 'invoices#invoice_items'
      get '/invoices/:id/items', to: 'invoices#items'
      resources :invoices, only: [:show, :index] do
        resources :transactions, only: [:index]
        get '/customer', to: 'invoices#customer'
        get '/merchant', to: 'invoices#merchant'
      end

      get '/invoice_items/random', to: 'invoice_items#random'
      get '/invoice_items/find', to: 'invoice_items#search'
      get '/invoice_items/find_all', to: 'invoice_items#search_all'
      resources :invoice_items, only: [:show, :index] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item', to: 'invoice_items#item'
      end

      get '/transactions/random', to: 'transactions#random'
      get '/transactions/find', to: 'transactions#search'
      get '/transactions/find_all', to: 'transactions#search_all'
      resources :transactions, only: [:show, :index] do
        get '/invoice', to: 'transactions#invoice'
      end
    end
  end
end
