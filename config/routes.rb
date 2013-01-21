Drdannicoll::Application.routes.draw do

  root :to => 'pages#home'

  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  get '/contact' => 'pages#contact'

  namespace :admin do
    get  'sign-in' => 'sessions#new', as: 'sign_in'
    post 'sign-in' => 'sessions#create'
    post 'sign-out' => 'sessions#destroy', as: 'sign_out'

    root :to => 'articles#index'

    resources :questions, :articles, :answers, :module => nil
  end

  resources :questions
  resources :articles
  resources :answers

end
