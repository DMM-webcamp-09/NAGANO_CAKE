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

