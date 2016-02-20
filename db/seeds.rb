# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times {User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, email: Faker::Internet.email)}

10.times {Type.create(name: Faker::Book.genre)}

10.times {Tag.create(name:Faker::Team.creature)}

# 20.times {venue.tags.create()

Event.create(name: "Jazz Stuff", description: 'So much goddamn jazz!', venue_id: 1, datetime: Faker::Time.between(DateTime.now - 1, DateTime.now) )

Event.create(name: "GLWSTX", description: "The heaviest drops!", venue_id: 2, datetime:Faker::Time.between(DateTime.now - 1, DateTime.now))

Venue.create(lat:"41.889816", lng:"-87.635504", name: "Rock n' Roll Town", type_id: 1 + rand(9), manager_id:1+ rand(49))

Venue.create(lat:"41.891398", lng:"-87.637435", name: "E-D-AMN", type_id: 2+ rand(10), manager_id: 1+ rand(50))

# 20.times {Rsvp.create(event.id)}
