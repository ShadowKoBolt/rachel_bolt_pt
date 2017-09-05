Rails.application.routes.draw do
  devise_for :users

  root 'application#index'

  namespace 'admin' do
    get '/' => 'users#index', as: 'root'
    resources :users, except: :show
  end

  get 'set_password/:reset_password_token' => 'users#set_password', as: 'set_password'
  patch 'set_password/:reset_password_token' => 'users#set_password'

  get 'consent' => 'consent#show'
  patch 'consent' => 'consent#update'
end
