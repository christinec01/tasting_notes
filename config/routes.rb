Rails.application.routes.draw do
  get 'notes/new'

 get '/search', to: 'notes#entry'
 root 'notes#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
