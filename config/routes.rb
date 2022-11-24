Rails.application.routes.draw do
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
    resources :customers, only: [:show, :edit, :update]
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/withdrow' => 'customers#withdrow'
    resources :orders, only: [:new, :index, :show]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :adresses, except: [:new, :show]
  end
end
