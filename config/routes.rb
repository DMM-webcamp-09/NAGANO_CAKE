Rails.application.routes.draw do
<<<<<<< HEAD
  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [ :show, :update] do
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

=======

# 管理者用
# URL /admin/sign_in ...
>>>>>>> origin/develop

namespace :admin do
    resources :members, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update] do
      resources :order_products, only: [:update]
    end
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    root to: 'homes#top'
  end
<<<<<<< HEAD
 devise_for :members,skip: [:passwords,], controllers: {
  registrations: "members/registrations",
  sessions: 'members/sessions'
}


  get 'members/products/index'
  get 'products/show'

  get 'products/index'
  get 'products/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
=======

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }



  root 'member/homes#top'
  
  devise_for :member,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}
    
  scope module: :member do
    resources :products, only: [:index, :show]
    get 'homes/about'
    get 'members/show'
    get 'members/edit'
    get 'members/unsubscribe'
    patch 'members/update'
    patch 'members/withdraw'
  end

end

 
>>>>>>> origin/develop
