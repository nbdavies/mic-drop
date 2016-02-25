# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
jimmy = User.create(username: "jimmy", password: "thruster", email: "jimmy@storageco.com", facebook_id: 1, picture_url: "https://pbs.twimg.com/profile_images/679812564570771456/7NRudISs.jpg")
gary = User.create(username: "gary", password: "thruster", email: "gary@storageco.com", facebook_id: 2, picture_url: "http://www.kotb.com/Gallery/GaryGlover1.JPG")
matt = User.create(username: "mattbaker", password: "thruster", email: "mattbaker@dbc.com", facebook_id: 3, picture_url: "https://pbs.twimg.com/profile_images/561979869978836993/SKiuwI3i.jpeg")

Friendship.create(user: jimmy, friend: gary)
Friendship.create(user: gary, friend: jimmy)
Friendship.create(user: jimmy, friend: matt)
Friendship.create(user: matt, friend: jimmy)
Friendship.create(user: matt, friend: gary)
Friendship.create(user: gary, friend: matt)

50.times do |i| 
	User.create(username: Faker::Internet.user_name, 
							password: Faker::Internet.password, 
							email: Faker::Internet.email, 
							facebook_id: i+3, 
							picture_url: Faker::Avatar.image)}
end
53.times do 
	user_id = rand(1..53)
	friend_id = rand(1..53)
	Friendship.create(user_id: user_id, friend_id: friend_id)
	Friendship.create(user_id: friend_id, friend_id: user_id)
end

types = ["Bar", "Coffeehouse", "Cafe", "Concert Hall", "Coop", "Theatre", "Church", "Auditorium", "Beer Hall", "Discoteque"]
types.each do |type|
	Type.create(name: type)
end

tags = ["18+", "21+", "3 drink min", "rock", "punk", "folk", "hiphop", "vaporwave", "breakcore", "seapunk", "brony", "cabaret", "occult", "rave", "vocaloid"]
tags.each do |tag|
	Tag.create(name: tag)
end

Venues.create(address: "225 W Hubbard St #2 Chicago, IL 60654", lat:"41.889816", lng:"-87.635504", name: "Rock n' Roll Town", type: Type.all.sample, manager_id: 1)
venues = [
{name: 'Bottom Lounge', address: '1375 W Lake St, Chicago, IL 60607', lat: "41.8856322", lng: "-87.6617276", type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Double Door', address: '1572 N Milwaukee Ave, Chicago, IL 60622', lat: "41.9098938", lng: "-87.6793358", type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Empty Bottle', address: '1035 N Western Ave, Chicago, IL 60622', lat: "41.9004067", lng: "-87.6889066", type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Lincoln Hall', address: '2424 N Lincoln Ave, Chicago, IL 60614', lat: "41.9259783", lng: "-87.6519459", type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Schubas', address: '3159 N Southport Ave, Chicago, IL 60657', lat: "41.9396435", lng: "-87.6657194", type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Metro', address: '3730 N Clark St, Chicago, IL 60613', lat: "41.9497998", lng: "-87.6609837", type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Green Windmill', address: '4802 N Broadway St, Chicago, IL 60640', lat: '41.9691891', lng: '-87.6620719', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Aragon Ballroom', address: '1106 W Lawrence Ave, Chicago, IL 60640', lat: '41.9651629', lng: '-87.6630034', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'House of Blues', address: '329 N Dearborn St, Chicago, IL 60654', lat: '41.888233', lng: '-87.6313187', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'The Mid', address: '306 N Halsted St, Chicago, IL 60661', lat: '41.8870952', lng: '-87.6500334', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Park West', address: '322 W Armitage Ave, Chicago, IL 60614', lat: '41.9185905', lng: '-87.6395697', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Concord Music Hall', address: '2047 N Milwaukee Ave, Chicago, IL 60647', lat: '41.9186603', lng: '-87.6923112', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Subterranean', address: '2011 W North Ave, Chicago, IL 60647', lat: '41.9103603', lng: '-87.6801589', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Riviera Theatre', address: '4746 N Racine Ave, Chicago, IL 60640', lat: '41.9687272', lng: '-87.6620577', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Elbo Room', address: '2871 N Lincoln Ave, Chicago, IL 60657', lat: '41.9342152', lng: '-87.6629058', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Refuge Live', address: '416 S Clark St, Chicago, IL 60605', lat: '41.876416', lng: '-87.6332607', type: Type.all.sample, manager_id: rand(1..3)},
{name: 'Harris Theater', address: '205 E Randolph St, Chicago, IL 60601', lat: '41.8839445', lng: '-87.6240677', type: Type.all.sample, manager_id: rand(1..3)}
]
venues.each do |venue|
	Venue.create(venue)
end

Tag.find(3).


Tag.first.events.create(name: "Jazz Stuff", description: 'So much goddamn jazz!', venue_id: 1, date: Date.today, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)
Event.first.tags.create(name: "Nick")
Tag.find(2).events.create(name: "GLWSTX", description: "The heaviest drops!", venue_id: 2, date: Faker::Time.between(Date.today - 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)
jimmy.rsvps.create(event_id: 1)

Tag.find(8).venues.create(address: "353 W Grand Ave Chicago, IL 60654", lat:"41.891398", lng:"-87.637435", name: "E-D-AMN", type_id: 2+ rand(10), manager_id: 1+ rand(50))

Tag.find(4).venues.create(address: "610 N Rush St, Chicago, IL 60611", lat:"41.8929485", lng:"-87.6279576", name: "Jimmy", type_id: 1 + rand(9), manager_id: 1)

Tag.find(9).venues.create(address: "540 N Dearborn St
Chicago, IL 60610", lat:"41.8920388", lng:"-87.6326061", name: "Storage Locker #312", type_id: 2+ rand(10), manager_id: 1)

Tag.find(4).events.create(name: "Slumber Party", description: 'Bring a toothbrush', venue_id: 3, date: Faker::Time.between(Date.today + 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)

Tag.find(7).events.create(name: "Pea Knuckle Tunament", description: "$100 to enter", venue_id: 4, date: Faker::Time.between(Date.today + 1, Date.today).to_date, start_time: Faker::Time.between(Date.today - 1, Date.today).to_time, end_time: Faker::Time.between(Date.today - 1, Date.today).to_time)

# 20.times {Rsvp.create(event.id)}
