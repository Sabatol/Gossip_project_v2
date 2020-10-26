Rails.application.routes.draw do

  root 'home#index'
  get '/team', to: 'team#show'
  get '/contact', to: 'contact#show'
  get '/welcome/:id', to: 'welcome#say_hello'
  resources :gossip 
  resources :user 
end
