Alpha::Application.routes.draw do
  match '/list',      :to => 'movies#list'
  match '/show',      :to => 'movies#show'
end
