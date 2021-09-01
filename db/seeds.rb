# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Zoo.destroy_all
Volunteer.destroy_all

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
