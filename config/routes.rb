Drdannicoll::Application.routes.draw do
  
  resources :questions

  resources :articles

  resources :answers

  root :to => 'pages#home'

  match '/about' => 'pages#about'
  match '/faq' => 'pages#faq'
  match '/contact' => 'pages#contact'

end
