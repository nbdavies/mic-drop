# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' ) { name: 'Copenhagen' }])
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
							picture_url: Faker::Avatar.image)
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

tags = ["18+", "21+", "3 drink min", "no cover", "rock", "punk", "folk", "hiphop", "vaporwave", "breakcore", "seapunk", "brony", "cabaret", "occult", "rave", "vocaloid"]
tags.each do |tag|
	Tag.create(name: tag)
end

Venue.create(address: "225 W Hubbard St #2 Chicago, IL 60654", lat:"41.889816", lng:"-87.635504", name: "Rock n' Roll Town", type: Type.all.sample, manager_id: 1)
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

20.times do
	Venue.all.sample.tags << Tag.all.sample
end

jazz = Event.create(name: "Jazz Stuff", description: 'So much goddamn jazz!', venue_id: 1, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/kenny.jpg'))
Rsvp.create(event: jazz, user: jimmy)
Rsvp.create(event: jazz, user: matt)

venues = Venue.all.to_a
venues.unshift
venues.shuffle!
Event.create(name: "GLWSTX", description: "The heaviest drops!", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/glwstx.jpg'))
Event.create(name: "Slumber Party", description: 'Bring a toothbrush', venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/slumber_party.jpg'))
Event.create(name: "Hatsune Miku Open Jam Session", description: 'Bring your instruments, the robot will bring her voice.', venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/hatsune_miku.jpeg'))
Event.create(name: "El Ten Eleven", description: 'Performing the entirety of their first album.', venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/el_ten_eleven.jpeg'))
Event.create(name: "Jimmy Eat World", description: 'with special guest Jimmy.', venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/jimmy_eat_world.jpg'))
Event.create(name: "Nickleback", description: 'A philibuster concert.', venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/nickelback-website21.jpeg'))
Event.create(name: "V A P O R W A V E", description: 'Go you party?', venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/vaporwave.jpg'))
Event.create(name: "Travis the Musical", description: "Let me tell you why you're wrong", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/travis.png'))
Event.create(name: "Pea Knuckle Turnament", description: "$100 to enter", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/pea_knuckle.jpg'))
Event.create(name: "DJ Airhorn", description: "Exclusive!", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/DJAirhorn.jpg'))
Event.create(name: "Logan Square Karaoke", description: "How many miles would you walk?", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/logan.jpg'))
Event.create(name: "Yakuza", description: "Death metal with saxophone", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/yakuza.jpg'))
Event.create(name: "Math Rock", description: "Many time signatures", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/mathrock.jpg'))
Event.create(name: "Tryptich3", description: "Chicago Nu-metal band reunion", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/tryptich.jpg'))
Event.create(name: "Reservoir", description: "Maine slow-core", venue: venues.pop, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/slowcore.jpg'))

20.times do
	Event.all.sample.tags << Tag.all.sample
end

100.times do
	Rsvp.find_or_create_by(event: Event.all.sample, user: User.all.sample)
end
