Rails.application.routes.draw do

get '/items/:id', to: 'items#show'

get '/manufacturers', to: 'manufacturers#index'

end
