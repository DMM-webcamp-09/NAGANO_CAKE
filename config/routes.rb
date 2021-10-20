Rails.application.routes.draw do
  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [ :index, :show, :update] do
      resources :order_produts, only: [ :update]
    end
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  devise_for :admin, controllers: {
  sessions: "admin/sessions" ,
  passwords: 'admin/passwords',
  registrations: 'admin/registrations'
  } 
  
    get 'products/index'
    get 'products/show'
    get 'menbers/index'



  namespace :member do
    get 'products/index'
    get 'products/show'
  end
 devise_for :members,skip: [:passwords,], controllers: {
  registrations: "members/registrations",
  sessions: 'members/sessions'
}

  get 'homes/about'
  get 'members/products/index'
  get 'products/show'

  get 'products/index'
  get 'products/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
