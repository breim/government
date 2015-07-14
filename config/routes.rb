Rails.application.routes.draw do
  resources :questions
  root 'pages#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  get '/backoffice' => 'admin/admin#index', as: :admin 
  namespace :admin do
  	resources :questions
  end

end
