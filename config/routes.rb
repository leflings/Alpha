Alpha::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :people
  resources :movies

  root :to => "pages#home"

  match '/about', :to => "pages#about"
  match '/contact', :to => "pages#contact"
  match '/signup', :to => "users#new"
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

end
