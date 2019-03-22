Rails.application.routes.draw do

  resources :ordeers
  resources :groups
  resources :friends


  get 'signup' , to:"users#signup"
  get 'signin' , to:"users#signin"

  root 'home#home'
  
  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
