Rails.application.routes.draw do

  scope module: :member do
    resources :products, only: [:index, :show]
  end
 devise_for :member,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }

end
