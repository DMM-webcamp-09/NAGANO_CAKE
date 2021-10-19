Rails.application.routes.draw do

root 'members/homes#top'

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

 devise_for :member,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}

  get 'members/products/index'
  get 'products/show'



  get 'products/index'
  get 'products/show'


end


