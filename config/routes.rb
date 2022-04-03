Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/items/:id', to: 'items#show'
  post '/items/:id', to: 'manufacturers#create'

  get '/manufacturers', to: 'manufacturers#index'
  post '/manufacturers', to: 'manufacturers#create'

  get '/projects/:id', to: 'projects#show'
end
