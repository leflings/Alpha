Alpha::Application.routes.draw do

  match '/about', :to => "pages#about"
  match '/contact', :to => "pages#contact"
  match '/signup', :to => "users#new"

  resources :users
  resources :people
  resources :movies
end
