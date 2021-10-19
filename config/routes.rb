Rails.application.routes.draw do


# 管理者用
# URL /admin/sign_in ...

namespace :admin do
    resources :members, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update] do
      resources :order_products, only: [:update]
    end
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    root to: 'homes#top'
  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"


  }



  namespace :member do
    get 'products/index'
    get 'products/show'
  end
 devise_for :members,skip: [:passwords,], controllers: {
  registrations: "members/registrations",
  sessions: 'members/sessions'
}

  get 'members/products/index'
  get 'products/show'



  get 'products/index'
  get 'products/show'
end