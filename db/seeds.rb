# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AmusementPark.destroy_all
Ride.destroy_all

amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                      cost_of_entry: 95,
                                      open_year_round: true,)
amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

ride = amusement_park_2.rides.create!(name: "The Beast",
                                    roller_coaster: true,
                                    top_speed: 55,)
ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
                                    roller_coaster: true,
                                    top_speed: 100,)
ride_3 = amusement_park.rides.create!(name: "Dumbo",
                                    roller_coaster: false,
                                    top_speed: 15,)
ride_4 = amusement_park.rides.create!(name: "Rock n Roller Coaster",
                                    roller_coaster: false,
                                    top_speed: 66,)


# Zoos
denver_zoo = Zoo.create!(name: "Denver City Zoo",
                    rank: 1,
                    state_funding: true,
                    city: "Denver")

austin_zoo = Zoo.create!(name: "Austin City Zoo",
                    rank: 3,
                    state_funding: false,
                    city: "Austin")

memphis_zoo = Zoo.create!(name: "Memphis City Zoo",
                    rank: 2,
                    state_funding: false,
                    city: "Memphis")


# Volunteers
volunteer_1 = denver_zoo.volunteers.create!(name: "Karen Dale",
                                     certified_trainer: true,
                                     years_of_experience: 4,)

volunteer_2 = denver_zoo.volunteers.create!(name: "Scott Dale",
                                     certified_trainer: false,
                                     years_of_experience: 1,)
