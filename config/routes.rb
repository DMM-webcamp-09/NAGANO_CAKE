Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions",

 }


namespace :admin do
    get 'top' => 'homes#top'
    resources :members, only:[:index, :show, :edit, :update]
<<<<<<< HEAD
    resources :orders, only:[:index, :show, :update]
=======
    resources :orders, only:[:index,:show, :update]
>>>>>>> origin/develop2
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_details, only: [:update]
  end



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
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :products, only: [:index, :show]
  end

end


