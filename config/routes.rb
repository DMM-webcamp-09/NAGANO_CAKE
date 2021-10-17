Rails.application.routes.draw do
  
    
# 管理者用
# URL /admin/sign_in ...

  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
     registrations: 'admin/registrations'
  }   
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end