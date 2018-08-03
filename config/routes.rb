Rails.application.routes.draw do
  get 'session_helper/log_in'
  get 'session_helper/current_user'
  get 'session_helper/logged_in'
  get 'session_helper/log_out'	

  root 'pages#home', as: :home
  get  'pages/secret_page', to: 'pages#secret_page'
  
  get  'signup', to: 'users#new'
  resources :users, except: [:new]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', :to => 'sessions#destroy'
  
end

