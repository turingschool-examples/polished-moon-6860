Rails.application.routes.draw do
  get '/items/:id', to: 'items#show'

  get '/manufacturers', to: 'manufacturers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
