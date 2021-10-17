Rails.application.routes.draw do
  devise_for :administrators
  devise_for :members,skip: [:passwords,], controllers: {
    registrations: "members/registrations",
    sessions: 'members/sessions'
  }
   
  get 'members/products/index'
  get 'products/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
