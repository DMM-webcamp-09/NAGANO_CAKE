Rails.application.routes.draw do
  
    
# 管理者用
# URL /admin/sign_in ...
get 'products/index'
get 'products/show'
  
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"


 }

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
