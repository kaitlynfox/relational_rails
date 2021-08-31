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
