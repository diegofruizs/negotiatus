Rails.application.routes.draw do
  
  

  devise_for :users
  resources :vendors
=begin    
    get "/vendors" index
    post "/vendors" create
    delete "/vendors/:id" delete
    get "/vendors/:id" show
    get "/vendors/new" new
    get "/vendors/:id/edit" edit
    patch "/vendors/:id" update
    put "/vendors/:id" update
=end

  resources :orders
=begin    
    get "/orders" index
=end

get 'welcome/index'
root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
