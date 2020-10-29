Rails.application.routes.draw do

  root 'gossips#index'
  get '/team', to: 'team#show'
  get '/contact', to: 'contact#show'
  get '/welcome/:id', to: 'welcome#say_hello'

  resources :gossips do
    resources :comments
  end

  resources :user 
  resources :cities
end
