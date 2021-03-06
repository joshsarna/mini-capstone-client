Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'
    get '/pictures/new' => 'pictures#new'
    post '/pictures' => 'pictures#create'
    
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

    get '/orders/new' => 'orders#new'
    post '/orders' => 'orders#create'
    get '/orders/:id' => 'orders#show'
    get '/carted_products' => 'carted_products#index'
    delete 'carted_products' => 'carted_products#destroy'
    get '/carted_products/new' => 'carted_products#new'
    post '/carted_products' => 'carted_products#create'
  end
end