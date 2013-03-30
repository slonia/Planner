Organizer::Application.routes.draw do

  resources :tasks


  resources :lists


  resources :groups


  resources :events


  resources :notes


  resources :categories


  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}

  resources :users

  root :to => 'users#index'
end
