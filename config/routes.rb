Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Welcome
  get '/', to: 'welcome#index'

  # AmusementPark
  get '/amusement_parks', to: 'amusement_parks#index'
  get '/amusement_park/:id', to: 'amusement_parks#show'

  # Ride
  get '/rides', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'

  # Zoo
  get '/zoos', to: 'zoos#index'
  get '/zoos/:id', to: 'zoos#show'

  # Volunteer
  get '/volunteers', to: 'volunteers#index'

end
