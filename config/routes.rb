Rails.application.routes.draw do
  
    
# 管理者用
# URL /admin/sign_in ...
get 'products/index'
get 'products/show'
  
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
   

  get 'members/products/index'
  get 'products/show'



  get 'products/index'
  get 'products/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }

end

 
