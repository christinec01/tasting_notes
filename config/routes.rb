Rails.application.routes.draw do
get 'notes/new'

 get '/search', to: 'notes#entry'
 root 'notes#new'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

 get '/signup' => 'users#new'
 post '/users' => 'users#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
