Drdannicoll::Application.routes.draw do

  root :to => 'pages#home'

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'

  namespace :admin do
    get  '/admin' => 'sessions#new', as: 'sign_in'
    get  'sign-in' => 'sessions#new', as: 'sign_in'
    post 'sign-in' => 'sessions#create'
    get  'sign-out' => 'sessions#destroy', as: 'sign_out'

    root :to => 'pages#home'

    resources :pages, only: [:home, :about], module: nil
    resources :questions, :articles, :answers, module: nil
  end

  resources :questions, :articles, :answers do
    get 'search', on: :collection
  end

end
