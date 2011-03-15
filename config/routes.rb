Alpha::Application.routes.draw do

  get "imdb/show"

  resources :users
  resources :people
  resources :movies
end
