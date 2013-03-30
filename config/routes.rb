Organizer::Application.routes.draw do

  get "page/index"

  resources :categories do
    resources :notes
  end
  resources :events
  resources :groups do
    resources :lists do
      resources :tasks
    end
  end

  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}

  resources :users do
    get 'main', :on => :collection, :as => :main
  end

  root :to => 'users#main'
end
