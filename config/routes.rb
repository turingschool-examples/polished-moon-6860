Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/items/:id', to: 'items#show'
  patch '/items/:id', to: 'items#update'
  
  get '/projects/:id', to: 'projects#show'

  get '/manufacturers', to: 'manufacturers#index'
end
