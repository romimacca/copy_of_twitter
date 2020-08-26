Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :tweets do
    post 'likes', to: 'tweets#likes'
    post 'retweet', to: 'tweets#retweet'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  get 'home/index'
  get 'explore', to: 'home#explore', as: 'explore'
  
  post 'follow/:user_id', to: 'user#follow', as:'users_follow' 

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
