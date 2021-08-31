Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Welcome
  get '/', to: 'welcome#index'

  # AmusementPark
  get '/amusement_parks', to: 'amusement_parks#index'
  get '/amusement_parks/new', to: 'amusement_parks#new'
  get '/amusement_parks/:id', to: 'amusement_parks#show'
  post '/amusement_parks', to: 'amusement_parks#create'
  get '/amusement_parks/:id/edit', to: 'amusement_parks#edit'
  patch '/amusement_parks/:id', to: 'amusement_parks#update'
  delete '/amusement_parks/:id', to: 'amusement_parks#destroy'

  # Rides by Amusement Park
  get '/amusement_parks/:id/rides', to: 'rides_by_amusement_park#index'
  get '/amusement_parks/:id/rides/new', to: 'rides_by_amusement_park#new'
  post '/amusement_parks/:id/rides', to: 'rides_by_amusement_park#create'

  # Ride
  get '/rides', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'
  get '/rides/:id/edit', to: 'rides#edit'
  patch '/rides/:id', to: 'rides#update'
  delete '/rides/:id', to: 'rides#destroy'

  # Zoo
  get '/zoos', to: 'zoos#index'
  get '/zoos/new', to: 'zoos#new'
  get '/zoos/:id', to: 'zoos#show'
  post '/zoos', to: 'zoos#create'
  get '/zoos/:id/edit', to: 'zoos#edit'
  patch '/zoos/:id', to: 'zoos#update'

  # VolunteersByZoo
  get '/zoos/:id/volunteers', to: 'volunteers_by_zoo#index'
  get '/zoos/:id/volunteers/new', to: 'volunteers_by_zoo#new'
  post '/zoos/:id/volunteers', to: 'volunteers_by_zoo#create'

  # Volunteer
  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'
  get '/volunteers/:id/edit', to: 'volunteers#edit'
  patch '/volunteers/:id', to: 'volunteers#update'


end
