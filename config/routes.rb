Rails.application.routes.draw do


 get '/search', to: 'notes#entry'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

 get '/signup' => 'users#new'
 post '/users' => 'users#create'
 root 'notes#index'


resources :users do
  resources :notes
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
