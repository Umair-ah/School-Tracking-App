Rails.application.routes.draw do
  resources :lessons
  
  resources :courses do
    member do
      patch :generate_lessons
    end
  end

  resources :services
  resources :classrooms

  devise_for :users, controllers: { 
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#home"

  resources :users, only: [:index, :show, :destroy, :edit, :update] do
    member do
      patch :ban
      patch :resend_confirmation_instructions
    end
  end
  
end
