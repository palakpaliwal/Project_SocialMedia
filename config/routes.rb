Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  root "users#index"
  # root "posts#index"
  resources :users
  resources :posts
  resources :home
  resources :notification
  resources :search
  resources :profile
  resources :posts do
    resources :comments
  end  
  # get '/users/:id', to:'user#show' '
end
