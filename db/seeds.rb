# Generic setup stuff
types = ["Bar", "Coffeehouse", "Cafe", "Concert Hall", "Coop", "Theatre", "Church", "Auditorium", "Beer Hall", "Discoteque"]
types.each do |type|
	Type.create(name: type)
end

tags = ["18+", "21+", "3 drink min", "no cover", "rock", "punk", "folk", "hiphop", "vaporwave", "breakcore", "seapunk", "brony", "cabaret", "occult", "rave", "vocaloid"]
tags.each do |tag|
	Tag.create(name: tag)
end

jimmy = User.create(username: "jimmy", password: "thruster", email: "jimmy@storageco.com", facebook_id: 1, picture_url: "https://pbs.twimg.com/profile_images/679812564570771456/7NRudISs.jpg")
gary = User.create(username: "gary", password: "thruster", email: "gary@storageco.com", facebook_id: 2, picture_url: "http://www.kotb.com/Gallery/GaryGlover1.JPG")
matt = User.create(username: "mattbaker", password: "thruster", email: "mattbaker@dbc.com", facebook_id: 3, picture_url: "https://pbs.twimg.com/profile_images/561979869978836993/SKiuwI3i.jpeg")
nick = User.create(username: "nick", password: "nick", email: "nbdavies@gmail.com", facebook_id: "10100783717560550", picture_url: "https://scontent.xx.fbcdn.net/hprofile-xpl1/v/t1.0-1/p50x50/12243268_10100723086675330_7008877343092239439_n.jpg?oh=a9117fcb1363d0dc9d3875f3b2c89b08&oe=5767BDBE")
phil = User.create(username: "phil", password: "phil", email: "pthomas551@gmail.com", facebook_id: "10101362403189895", picture_url: "https://scontent.xx.fbcdn.net/hprofile-xat1/v/t1.0-1/p50x50/12144808_10101244057525555_7926590566291461552_n.jpg?oh=576b0f1773351623032bf3e954939777&oe=575FC8E3")
bob = User.create(username: "bob", password: "bob", email: "robertdorff@gmail.com", facebook_id: "856179033335", picture_url: "https://scontent.xx.fbcdn.net/hprofile-xap1/v/t1.0-1/c0.0.50.50/p50x50/1380773_681151325265_1917149146_n.jpg?oh=564d2b786510a5285b69ffcd0749224e&oe=575F3509")
sabrina = User.create(username: "sabrina", password: "hooray", email: "sabrina1@sabrina.com", facebook_id: "10154748116949152", picture_url: "https://scontent.xx.fbcdn.net/hprofile-xfp1/v/t1.0-1/p50x50/1652_10154636933139152_6295239302210131119_n.jpg?oh=1ce34b10481153b2aa32030b23ace397&oe=575863AF")

# Everyone is friends yay
friends = [jimmy, gary, matt, nick, bob, phil, sabrina]
friends.each do |user|
	friends.each do |friend|
		Friendship.create(user: user, friend: friend) if user != friend
	end
end

# Chicago venues
# Bob manages House of Blues
# Phil manages Park West
# Jimmy manages Rock n' Roll Town
chicago_venues = [
Venue.create(name: "Rock n' Roll Town", address: "225 W Hubbard St #2 Chicago, IL 60654", lat:"41.889816", lng:"-87.635504", type: Type.all.sample, manager: jimmy),
Venue.create(name: 'Bottom Lounge', address: '1375 W Lake St, Chicago, IL 60607', lat: "41.8856322", lng: "-87.6617276", type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Double Door', address: '1572 N Milwaukee Ave, Chicago, IL 60622', lat: "41.9098938", lng: "-87.6793358", type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Empty Bottle', address: '1035 N Western Ave, Chicago, IL 60622', lat: "41.9004067", lng: "-87.6889066", type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Lincoln Hall', address: '2424 N Lincoln Ave, Chicago, IL 60614', lat: "41.9259783", lng: "-87.6519459", type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Schubas', address: '3159 N Southport Ave, Chicago, IL 60657', lat: "41.9396435", lng: "-87.6657194", type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Metro', address: '3730 N Clark St, Chicago, IL 60613', lat: "41.9497998", lng: "-87.6609837", type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Green Mill', address: '4802 N Broadway St, Chicago, IL 60640', lat: '41.9691891', lng: '-87.6620719', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Aragon Ballroom', address: '1106 W Lawrence Ave, Chicago, IL 60640', lat: '41.9651629', lng: '-87.6630034', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'House of Blues', address: '329 N Dearborn St, Chicago, IL 60654', lat: '41.888233', lng: '-87.6313187', type: Type.all.sample, manager: bob),
Venue.create(name: 'The Mid', address: '306 N Halsted St, Chicago, IL 60661', lat: '41.8870952', lng: '-87.6500334', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Park West', address: '322 W Armitage Ave, Chicago, IL 60614', lat: '41.9185905', lng: '-87.6395697', type: Type.all.sample, manager: phil),
Venue.create(name: 'Concord Music Hall', address: '2047 N Milwaukee Ave, Chicago, IL 60647', lat: '41.9186603', lng: '-87.6923112', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Subterranean', address: '2011 W North Ave, Chicago, IL 60647', lat: '41.9103603', lng: '-87.6801589', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Riviera Theatre', address: '4746 N Racine Ave, Chicago, IL 60640', lat: '41.9687272', lng: '-87.6620577', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Elbo Room', address: '2871 N Lincoln Ave, Chicago, IL 60657', lat: '41.9342152', lng: '-87.6629058', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Refuge Live', address: '416 S Clark St, Chicago, IL 60605', lat: '41.876416', lng: '-87.6332607', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: 'Harris Theater', address: '205 E Randolph St, Chicago, IL 60601', lat: '41.8839445', lng: '-87.6240677', type: Type.all.sample, manager: User.all.sample)
]
denver_venues = [
	Venue.create(name: "Boulder Theater", address: "2032 14th St, Boulder, CO 80302", lat: "40.0192", lng: "-105.2772", type: Type.all.sample, manager_id: 1),
	Venue.create(name: "Fox Theater", address: '1135 13th St Boulder, CO 80302', lat: "40.0080", lng: "-105.2765", type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Paramount Theater", address: '1621 Glenarm Pl, Denver, CO 80202', lat: "39.7444", lng: "-104.9902", type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Gothic Theater", address: '3263 S Broadway, Englewood, CO 80113', lat: " 39.657647", lng: " -104.987756", type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Swallow Hill Music", address: '71 E Yale Ave, Denver, CO 80210', lat: "39.6680", lng: "-104.9867", type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Bluebird", address: '3317 E Colfax Ave, Denver, CO 80206', lat: "39.7406", lng: "-104.9478", type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "The Grizzly Rose", address: '5450 N Valley Hwy, Denver, CO 80216', lat: "39.795137", lng: "-104.986882", type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Laramier Lounge", address: '2721 Larimer St, Denver, CO 80205', lat: '39.760994', lng: '-104.983931', type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Hi Dive", address: '7 S Broadway, Denver, CO 80223', lat: '39.716394', lng: '-104.987862', type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Herman’s Hideaway", address: '1578 S Broadway, Denver, CO 80210', lat: '39.689707', lng: '-104.987533', type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "The Soiled Dove Underground", address: '7401 E 1st Ave, Denver, CO 80230', lat: '39.720001', lng: '-104.901149', type: Type.all.sample, manager_id: rand(1..3)),
	Venue.create(name: "Cervantes Masterpiece", address: '2635 Welton St, Denver, CO 80205', lat: '39.755178', lng: '-104.978390', type: Type.all.sample, manager: sabrina)
]
# Chicago events
(0..6).each do |i|
	venues = chicago_venues.shuffle
	Event.create(name: "GLWSTX", description: "The heaviest drops!", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/glwstx.jpg'))
	Event.create(name: "Slumber Party", description: 'Bring a toothbrush', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/slumber_party.jpg'))
	Event.create(name: "Hatsune Miku Open Jam Session", description: 'Bring your instruments, the robot will bring her voice.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/hatsune_miku.jpeg'))
	Event.create(name: "El Ten Eleven", description: 'Performing the entirety of their first album.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/el_ten_eleven.jpeg'))
	Event.create(name: "Jimmy Eat World", description: 'with special guest Jimmy.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/jimmy_eat_world.jpg'))
	Event.create(name: "Nickleback", description: 'A philibuster concert.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/nickelback-website21.jpeg'))
	Event.create(name: "V A P O R W A V E", description: 'Go you party?', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/vaporwave.jpg'))
	Event.create(name: "Travis the Musical", description: "Let me tell you why you're wrong", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/travis.png'))
	Event.create(name: "Pea Knuckle Turnament", description: "$100 to enter", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/pea_knuckle.jpg'))
	Event.create(name: "DJ Airhorn", description: "Exclusive!", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/DJAirhorn.jpg'))
	Event.create(name: "Logan Square Karaoke", description: "How many miles would you walk?", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/logan.jpg'))
	Event.create(name: "Yakuza", description: "Death metal with saxophone", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/yakuza.jpg'))
	Event.create(name: "Math Rock", description: "Many time signatures", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/mathrock.jpg'))
	Event.create(name: "Tryptich3", description: "Chicago Nu-metal band reunion", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/tryptich.jpg'))
	Event.create(name: "Reservoir", description: "Maine slow-core", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/slowcore.jpg'))
end
# Denver events
(0..6).each do |i|
	venues = denver_venues.shuffle
	Event.create(name: "GLWSTX", description: "The heaviest drops!", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/glwstx.jpg'))
	Event.create(name: "Slumber Party", description: 'Bring a toothbrush', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/slumber_party.jpg'))
	Event.create(name: "Hatsune Miku Open Jam Session", description: 'Bring your instruments, the robot will bring her voice.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/hatsune_miku.jpeg'))
	Event.create(name: "Jimmy Eat World", description: 'with special guest Jimmy.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/jimmy_eat_world.jpg'))
	Event.create(name: "Nickleback", description: 'A philibuster concert.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/nickelback-website21.jpeg'))
	Event.create(name: "V A P O R W A V E", description: 'Go you party?', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/vaporwave.jpg'))
	Event.create(name: "Travis the Musical", description: "Let me tell you why you're wrong", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/travis.png'))
	Event.create(name: "DJ Airhorn", description: "Exclusive!", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/DJAirhorn.jpg'))
	Event.create(name: "Logan Square Karaoke", description: "How many miles would you walk?", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/logan.jpg'))
	Event.create(name: "Darmok and Jalad", description: "Death metal with saxophone", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/yakuza.jpg'))
	Event.create(name: "Four Star Mary as Dingoes Ate My Baby", description: "Many time signatures", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/mathrock.jpg'))
	Event.create(name: "Nerf Herder", description: "Chicago Nu-metal band reunion", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/tryptich.jpg'))
end
jazz = Event.create(name: "Jazz Stuff", description: 'So much goddamn jazz!', venue_id: 1, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/kenny.jpg'))
Rsvp.create(event: jazz, user: jimmy)
Rsvp.create(event: jazz, user: matt)

madison_venues = [
Venue.create(name: "High Noon Saloon", address: '701 E Washington Ave, Madison, WI 53703', lat: '43.079593', lng: '-89.376483', type: Type.all.sample, manager: nick),
Venue.create(name: "The Frequency", address: '121 W Main St, Madison, WI 53703', lat: '43.0723792', lng: '-89.3869828', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Dragonfly Lounge", address: '401 E Washington Ave, Madison, WI 53703', lat: '43.0772736', lng: '-89.3820378', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "The Wisco", address: '852 Williamson St, Madison, WI 53703', lat: '43.0794813', lng: '-89.3722515', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Mr. Roberts", address: '2116 Atwood Ave, Madison, WI 53704', lat: '43.0929631', lng: '-89.3536505', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "The Majestic", address: '115 King St, Madison, WI 53703', lat: '43.0744173', lng: '-89.383129', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Tip Top Tavern", address: '601 North St, Madison, WI 53704', lat: '43.1069511', lng: '-89.3532424', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Red Zone", address: '1212 Regent St, Madison, WI 53715', lat: '43.0680606', lng: '-89.408404', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Johnson Public House", address: '908 E Johnson St, Madison, WI 53703', lat: '43.0847298', lng: '-89.3783618', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Chocolaterian Cafe", address: '2004 Atwood Ave, Madison, WI 53704', lat: '43.0922594', lng: '-89.3569205', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Alchemy", address: '1980 Atwood Ave, Madison, WI 53704', lat: '43.092431', lng: '-89.3575805', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Nutty Bar", address: 'Gateway Mall, 600 Williamson St, Madison, WI 53703', lat: '43.0770308', lng: '-89.3766051', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Der Rathskeller", address: '800 Langdon St, Madison, WI 53706', lat: '43.0742171', lng: '-89.4105087', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "The Sett", address: '1308 W Dayton St, Madison, WI 53715', lat: '43.071739', lng: '-89.4101487', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Mickey's", address: '1524 Williamson St, Madison, WI 53703', lat: '43.0879059', lng: '-89.3609353', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Crystal Corner", address: '1302 Williamson St, Madison, WI 53703', lat: '43.0847613', lng: '-89.3647873', type: Type.all.sample, manager: User.all.sample),
Venue.create(name: "Mother Fool's", address: '1101 Williamson St, Madison, WI 53703', lat: '43.0819339', lng: '-89.3679771', type: Type.all.sample, manager: User.all.sample)
]
(0..6).each do |i|
	venues = madison_venues.shuffle
	Event.create(name: "Gentle Brontosaurus", description: "Indie pop that politely suggests you might dance", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/gentlebronto.jpg'))
	Event.create(name: "Square Bombs", description: 'Retro prog songs about cats', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/squarebombs.jpg'))
	Event.create(name: "The Earthlings", description: 'Hi-tech psychadelic space-pop. Band members vary.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/earthlings.jpg'))
	Event.create(name: "Owls, Foxes, and Sebastian", description: 'Listen if you like the idea of Morrisey replacing Julian Casablancas, with saxophone solos', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/owlsfoxessebastian.jpg'))
	Event.create(name: "Little Red Wolf", description: 'LRW need no introduction or amplification. This all-star team of instrumentalists trade off leading and harmony vocals on their rustic folk-pop songs', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/littleredwolf.jpg'))
	Event.create(name: "The Wells Division", description: 'Folk rock richly layered with accordion, organ, and ', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/wellsdivision.jpg'))
	Event.create(name: "Wood Chickens", description: 'Raucous Bluegrass Punk. Punkgrass? Sure!', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/woodchickens.jpg'))
	Event.create(name: "Skyline Sounds", description: "Indie rock that is definitely not emo", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/skylinesounds.jpg'))
	Event.create(name: "The Ferns", description: "Combines surf and prog influences with post-punk", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/ferns.jpg'))
	Event.create(name: "Heavy Looks", description: "Some might say power-pop, some might say pop-punk, the latter are wrong", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/heavylooks.png'))
	Event.create(name: "The Civil Engineers", description: "The question is not whether they will funk, but rather, how much funk they will funk the funk", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/civilengineers.jpg'))
	Event.create(name: "The Werewolverine", description: "Indie folk that wouldn't disturb a woodland creature's hibernation", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/werewolverine.jpg'))
	Event.create(name: "Cats on Leashes", description: "They'll show up and play some punk songs", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/catsonleashes.jpg'))
	Event.create(name: "Pollinators", description: "Covering the ground between post-rock and power-pop", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/pollinators.jpg'))
	Event.create(name: "Sexy Ester", description: "Because you really do want some sassy new wave in your life", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/sexyester.jpg'))
	Event.create(name: "Oh My Love", description: "This group has gone from ukulele-driven indie-pop to triphop and dubstep", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/ohmylove.jpg'))
	Event.create(name: "Lords of the Trident", description: "What other power metal band sends you valentines and arms you with battle axes", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/lordsofthetrident.jpg'))
end

40.times do
	Venue.all.sample.tags << Tag.all.sample
end

200.times do
	Event.all.sample.tags << Tag.all.sample
end

# Create randos
50.times do |i|
	User.create(username: Faker::Internet.user_name,
							password: Faker::Internet.password,
							email: Faker::Internet.email,
							facebook_id: i+3,
							picture_url: Faker::Avatar.image)
end
# Randos need friends too
53.times do
	user = User.all.sample
	friend = User.all.sample
	Friendship.create(user: user, friend: friend)
	Friendship.create(user: friend, friend: user)
end
# Randos go to events
1500.times do
	Rsvp.find_or_create_by(event: Event.all.sample, user: User.all.sample)
end


