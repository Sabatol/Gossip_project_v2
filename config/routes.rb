Rails.application.routes.draw do

  root 'gossips#index'
  get '/team', to: 'team#show'
  get '/contact', to: 'contact#show'
  get '/welcome/:id', to: 'welcome#say_hello', as: 'welcome'

  resources :gossips do
    resources :comments
    resources :likes
  end
  resources :session, only: [:new, :create, :destroy]
  resources :user 
  resources :cities
end
