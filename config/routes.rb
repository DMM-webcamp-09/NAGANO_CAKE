Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
