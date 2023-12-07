Rails.application.routes.draw do
  
  get 'admin_sessions/new'
  get 'admin_sessions/create'
  get 'admin_sessions/destroy'
  resources :comments
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
root to: "public/homes#top"
get 'customers/my_page' => 'public/customers#show'
get 'customers/edit' => 'public/customers#edit'
patch 'customers/my_page' => 'public/customers#update'
get 'customers/confirmation' => 'public/customers#confirmation'
get 'orders/completed' => 'public/orders#complete'
patch 'customers/withdrawal' => 'public/customers#withdrawal'
devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
 scope module: :public do
  resources :items, only: [:index, :show]
  resources :cartitems,  only: [:create, :update, :destroy]
   resources :cartitems,  only: [:index]
   post 'orders/confirmation' => 'orders#confirmation'
  resources :orders
 end
 
 resources :admin_sessions, only: [:new, :create, :destroy]
 namespace:admin do 
  resources :items
  resources :customers
  get 'admin/orders' => 'admin/orders'
 end

end
