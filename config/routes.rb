Rails.application.routes.draw do
  resources :questions
  root 'pages#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
