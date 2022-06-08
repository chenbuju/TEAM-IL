
Rails.application.routes.draw do
  resources :cryptostables
  devise_for :users
  get 'home/about'
  get 'home/lookup'
  post 'home/lookup' => 'home/lookup'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end