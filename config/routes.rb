Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Welcome
  get '/', to: 'welcome#index'

  # AmusementPark
  get '/amusement_parks', to: 'amusement_parks#index'
  get '/amusement_parks/new', to: 'amusement_parks#new'
  get '/amusement_parks/:id', to: 'amusement_parks#show'
  post '/amusement_parks', to: 'amusement_parks#create'
  post '/amusement_parks', to: 'amusement_parks#create'
  get '/amusement_parks/:id/edit', to: 'amusement_parks#edit'
  patch '/amusement_parks/:id', to: 'amusement_parks#update'

  # Rides by Amusement Park
  get '/amusement_parks/:id/rides', to: 'rides_by_amusement_park#index'

  # Ride
  get '/rides', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'

  # Zoo
  get '/zoos', to: 'zoos#index'
  get '/zoos/:id', to: 'zoos#show'

  # Volunteer
  get '/volunteers', to: 'volunteers#index'

end
