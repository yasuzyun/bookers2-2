Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index,:show,:edit,:update]
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  
  devise_for :users
  
  root 'homes#top'
  get 'home/about'=>'homes#about'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end