Rails.application.routes.draw do

root 'members/homes#top'

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



  scope module: :member do
    resources :products, only: [:index, :show]
  end
 devise_for :member,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}


end
