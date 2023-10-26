Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post 'users/:id/follow', to: 'friend#follow', as:'follow'
  post 'users/:id/unfollow', to: 'friend#unfollow', as:'unfollow'
  post 'users/:id/accept', to: 'friend#accept', as:'accept'
  post 'users/:id/decline', to: 'friend#decline', as:'decline'
  post 'users/:id/cancle', to: 'friend#cancle', as:'cancle'
  post '/follower', to:'friend#follower', as:'follower'
  get '/following', to:'friend#following', as:'following'
  # get '/following', to: 'friend#following_list', as: 'following_list'
  # root "home#index"

  get 'stories/create'
  get 'stories/show'
  get 'stories/new'
  get 'stories/index'
  get 'strories/create'



  root "users#index"
  resources :likes
  patch '/users/id/unlike', to:'likes#unlike'
  patch '/users/id/unlike', to:'likes#like'

  # root "posts#index"
  resources :users
  get 'total_user', to:'users#total_user'
  get 'search', to:'users#search'
  resources :posts
  resources :home
  resources :notification
  resources :search
  resources :profile
  resources :friend
  # resources :posts do
  #   resources :comments
  # end  
  resources :comments
  get '/users/id/comment', to: 'comments#create'
  resources :rooms
  resources :users do
    collection do
    get 'search'
    end
  end

  resources :posts do
    resources :comments
    resources :likes,only: [:create, :destroy ]
  end

  resources :my_profiles

  resources :stories

  

end

  
