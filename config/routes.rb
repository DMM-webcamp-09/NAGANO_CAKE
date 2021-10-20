Rails.application.routes.draw do


# 管理者用
# URL /admin/sign_in ...

namespace :admin do
    get 'top' => 'homes#top'
    resources :members, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_details, only: [:update]
  end



  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"


  }

end




