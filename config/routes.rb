Rails.application.routes.draw do
  devise_for :members
  get 'products/index'
  get 'products/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
