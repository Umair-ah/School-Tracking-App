Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#home"
  resources :users, only: [:index, :show, :destroy]
end
