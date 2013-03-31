Organizer::Application.routes.draw do

  get "page/index"

  resources :categories
  resources :notes
  resources :events
  resources :groups
  resources :lists
  resources :tasks


  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}

  resources :users do
    get 'main', :on => :collection, :as => :main
  end

  root :to => 'users#main'
end
