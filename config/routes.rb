Alpha::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :people
  resources :movies
  resources :relationships, :only => [:create, :destroy]

  root :to => "pages#home"

  match 'movies/:id/add_relationship', :as => "add_relationship", :to => "movies#add_relationship"
  match 'users/:id/promote', :as => "user_promote", :to => "users#promote"
  match 'users/:id/demote', :as => "user_demote", :to => "users#demote"
  match '/about', :to => "pages#about"
  match '/contact', :to => "pages#contact"
  match '/signup', :to => "users#new"
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

end
