Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:index, :show]
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:show, :edit, :update]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :index, :show]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :addresses, except: [:new, :show]
  end
end
