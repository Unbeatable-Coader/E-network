Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root 'home#index'


  get '/profile', to: 'profile#new'
  post '/profile', to: 'profile#create'

  get '/posts', to: 'posts#index'

  get '/newPost', to: 'posts#new'
  post '/posts', to: 'posts#create'

  get '/userProfile', to: 'profile#user_profile'

  get '/edit/user', to: 'profile#edit'

  post '/upload/profile/pic', to: 'profile#profile_pic', as: :upload_profile_pic_user_detail

  post '/comment', to: 'comment#comment'

  resources :rooms
  resources :users
  get '/chats', to: 'rooms#index'

end
