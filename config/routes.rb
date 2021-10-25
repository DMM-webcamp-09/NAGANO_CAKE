Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"

 }


namespace :admin do
    get 'top' => 'homes#top'
    resources :members, only:[:index, :show, :edit, :update]

    resources :orders, only:[:index, :show, :update]



    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_details, only: [:update]
    get 'search' => 'products#search'
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
    delete "cart_products/destroy_all" => "cart_products#destroy_all"
    resources :cart_products, only: [:index, :create, :update, :destroy]
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]

    resources :products, only: [:index, :show]

    get "orders/new" => "orders#new"
    get "orders/confirm" => "orders#confirm"
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, only: [:index, :show, :create]



  end

end


