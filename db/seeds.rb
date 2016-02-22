# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "jimmy", password: "thruster", email: "jimmy@storageco.com")

50.times {User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, email: Faker::Internet.email)}

10.times {Type.create(name: Faker::Book.genre)}

10.times {Tag.create(name:Faker::Team.creature)}

# 20.times {venue.tags.create()

Event.create(name: "Jazz Stuff", description: 'So much goddamn jazz!', venue_id: 1, date: Faker::Time.between(Date.today - 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)

Event.create(name: "GLWSTX", description: "The heaviest drops!", venue_id: 2, date: Faker::Time.between(Date.today - 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)

Venue.create(address: "225 W Hubbard St #2 Chicago, IL 60654", lat:"41.889816", lng:"-87.635504", name: "Rock n' Roll Town", type_id: 1 + rand(9), manager_id:1+ rand(49))

Venue.create(address: "353 W Grand Ave Chicago, IL 60654", lat:"41.891398", lng:"-87.637435", name: "E-D-AMN", type_id: 2+ rand(10), manager_id: 1+ rand(50))

Venue.create(address: "610 N Rush St, Chicago, IL 60611", lat:"41.8929485", lng:"-87.6279576", name: "Jimmy", type_id: 1 + rand(9), manager_id: 1)

Venue.create(address: "540 N Dearborn St
Chicago, IL 60610", lat:"41.8920388", lng:"-87.6326061", name: "Storage Locker #312", type_id: 2+ rand(10), manager_id: 1)

Event.create(name: "Slumber Party", description: 'Bring a toothbrush', venue_id: 3, date: Faker::Time.between(Date.today - 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)

Event.create(name: "Pea Knuckle Tunament", description: "$100 to enter", venue_id: 4, date: Faker::Time.between(Date.today - 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)

# 20.times {Rsvp.create(event.id)}
