Rails.application.routes.draw do
  devise_for :users, controllers: { 
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:index, :show, :destroy] do
    member do
      patch :ban
    end
  end
  
  root "statics#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
