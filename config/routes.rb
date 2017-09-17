Rails.application.routes.draw do
  get 'video/:id' => 'videos#show', as: 'video'

  devise_for :users

  root 'application#index'

  namespace 'admin' do
    get '/' => 'users#index', as: 'root'
    resources :users, except: :show
    resources :videos, except: :show
  end

  get 'set_password/:reset_password_token' => 'users#set_password', as: 'set_password'
  patch 'set_password/:reset_password_token' => 'users#set_password'

  get 'consent' => 'consent#show'
  patch 'consent' => 'consent#update'

  get 'my_account' => 'user#home', as: 'user_root'
  get 'one_off_payment' => 'payments#one_off_payment'
  post 'one_off_payment' => 'payments#process_one_off_payment'

  get 'payment/success' => 'payments#success'

end
