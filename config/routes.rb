Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Welcome
  get '/', to: 'welcome#index'

  # AmusementPark
  get '/amusement_parks', to: 'amusement_parks#index'
  get '/amusement_parks/:id', to: 'amusement_parks#show'

  # Rides by Amusement Park
  get '/amusement_parks/:id/rides', to: 'rides_by_amusement_park#index'

  # Ride
  get '/rides', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'

  # Zoo
  get '/zoos', to: 'zoos#index'
  get '/zoos/:id', to: 'zoos#show'

  # VolunteersByZoo
  get '/zoos/:id/volunteers', to: 'volunteers_by_zoo#index'

  # Volunteer
  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'

end
