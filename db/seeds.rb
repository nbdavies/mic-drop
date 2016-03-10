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
venues = [
{name: "Rock n' Roll Town", address: "225 W Hubbard St #2 Chicago, IL 60654", lat:"41.889816", lng:"-87.635504", type: Type.all.sample, manager: jimmy}
{name: 'Bottom Lounge', address: '1375 W Lake St, Chicago, IL 60607', lat: "41.8856322", lng: "-87.6617276", type: Type.all.sample, manager: User.all.sample},
{name: 'Double Door', address: '1572 N Milwaukee Ave, Chicago, IL 60622', lat: "41.9098938", lng: "-87.6793358", type: Type.all.sample, manager: User.all.sample},
{name: 'Empty Bottle', address: '1035 N Western Ave, Chicago, IL 60622', lat: "41.9004067", lng: "-87.6889066", type: Type.all.sample, manager: User.all.sample},
{name: 'Lincoln Hall', address: '2424 N Lincoln Ave, Chicago, IL 60614', lat: "41.9259783", lng: "-87.6519459", type: Type.all.sample, manager: User.all.sample},
{name: 'Schubas', address: '3159 N Southport Ave, Chicago, IL 60657', lat: "41.9396435", lng: "-87.6657194", type: Type.all.sample, manager: User.all.sample},
{name: 'Metro', address: '3730 N Clark St, Chicago, IL 60613', lat: "41.9497998", lng: "-87.6609837", type: Type.all.sample, manager: User.all.sample},
{name: 'Green Mill', address: '4802 N Broadway St, Chicago, IL 60640', lat: '41.9691891', lng: '-87.6620719', type: Type.all.sample, manager: User.all.sample},
{name: 'Aragon Ballroom', address: '1106 W Lawrence Ave, Chicago, IL 60640', lat: '41.9651629', lng: '-87.6630034', type: Type.all.sample, manager: User.all.sample},
{name: 'House of Blues', address: '329 N Dearborn St, Chicago, IL 60654', lat: '41.888233', lng: '-87.6313187', type: Type.all.sample, manager: bob},
{name: 'The Mid', address: '306 N Halsted St, Chicago, IL 60661', lat: '41.8870952', lng: '-87.6500334', type: Type.all.sample, manager: User.all.sample},
{name: 'Park West', address: '322 W Armitage Ave, Chicago, IL 60614', lat: '41.9185905', lng: '-87.6395697', type: Type.all.sample, manager: phil},
{name: 'Concord Music Hall', address: '2047 N Milwaukee Ave, Chicago, IL 60647', lat: '41.9186603', lng: '-87.6923112', type: Type.all.sample, manager: User.all.sample},
{name: 'Subterranean', address: '2011 W North Ave, Chicago, IL 60647', lat: '41.9103603', lng: '-87.6801589', type: Type.all.sample, manager: User.all.sample},
{name: 'Riviera Theatre', address: '4746 N Racine Ave, Chicago, IL 60640', lat: '41.9687272', lng: '-87.6620577', type: Type.all.sample, manager: User.all.sample},
{name: 'Elbo Room', address: '2871 N Lincoln Ave, Chicago, IL 60657', lat: '41.9342152', lng: '-87.6629058', type: Type.all.sample, manager: User.all.sample},
{name: 'Refuge Live', address: '416 S Clark St, Chicago, IL 60605', lat: '41.876416', lng: '-87.6332607', type: Type.all.sample, manager: User.all.sample},
{name: 'Harris Theater', address: '205 E Randolph St, Chicago, IL 60601', lat: '41.8839445', lng: '-87.6240677', type: Type.all.sample, manager: User.all.sample}
]
venues.each do |venue|
	Venue.create(venue)
end

20.times do
	Venue.all.sample.tags << Tag.all.sample
end

# Chicago events
(0..30).each do |i|
	venues = Venue.all.to_a.shuffle
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
jazz = Event.create(name: "Jazz Stuff", description: 'So much goddamn jazz!', venue_id: 1, date: Date.today, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('public/kenny.jpg'))
Rsvp.create(event: jazz, user: jimmy)
Rsvp.create(event: jazz, user: matt)

madison_venues = [
Venue.create(name: "High Noon Saloon", address: '701 E Washington Ave, Madison, WI 53703', lat: '43.079593', lng: '-89.376483'),
Venue.create(name: "The Frequency", address: '121 W Main St, Madison, WI 53703', lat: '43.0723792', lng: '-89.3869828'),
Venue.create(name: "Dragonfly Lounge", address: '401 E Washington Ave, Madison, WI 53703', lat: '43.0772736', lng: '-89.3820378'),
Venue.create(name: "The Wisco", address: '852 Williamson St, Madison, WI 53703', lat: '43.0794813', lng: '-89.3722515'),
Venue.create(name: "Mr. Roberts", address: '2116 Atwood Ave, Madison, WI 53704', lat: '43.0929631', lng: '-89.3536505'),
Venue.create(name: "The Majestic", address: '115 King St, Madison, WI 53703', lat: '43.0744173', lng: '-89.383129'),
Venue.create(name: "Tip Top Tavern", address: '601 North St, Madison, WI 53704', lat: '43.1069511', lng: '-89.3532424'),
Venue.create(name: "Red Zone", address: '1212 Regent St, Madison, WI 53715', lat: '43.0680606', lng: '-89.408404'),
Venue.create(name: "Johnson Public House", address: '908 E Johnson St, Madison, WI 53703', lat: '43.0847298', lng: '-89.3783618'),
Venue.create(name: "Chocolaterian Cafe", address: '2004 Atwood Ave, Madison, WI 53704', lat: '43.0922594', lng: '-89.3569205'),
Venue.create(name: "Alchemy", address: '1980 Atwood Ave, Madison, WI 53704', lat: '43.092431', lng: '-89.3575805'),
Venue.create(name: "Nutty Bar", address: 'Gateway Mall, 600 Williamson St, Madison, WI 53703', lat: '43.0770308', lng: '-89.3766051'),
Venue.create(name: "Der Rathskeller", address: '800 Langdon St, Madison, WI 53706', lat: '43.0742171', lng: '-89.4105087'),
Venue.create(name: "The Sett", address: '1308 W Dayton St, Madison, WI 53715', lat: '43.071739', lng: '-89.4101487'),
Venue.create(name: "Mickey's", address: '1524 Williamson St, Madison, WI 53703', lat: '43.0879059', lng: '-89.3609353'),
Venue.create(name: "Crystal Corner", address: '1302 Williamson St, Madison, WI 53703', lat: '43.0847613', lng: '-89.3647873'),
Venue.create(name: "Mother Fool's", address: '1101 Williamson St, Madison, WI 53703', lat: '43.0819339', lng: '-89.3679771')
]
(0..30).each do |i|
	venues = madison_venues.shuffle
	Event.create(name: "Gentle Brontosaurus", description: "Indie pop that politely suggests you might dance", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xpf1/v/t1.0-9/12742272_1263356573679094_3976657332199890115_n.jpg?oh=a60f53e59ed2cfc6b3f5b938abd02c75&oe=5762A916'))
	Event.create(name: "Square Bombs", description: 'Retro prog songs about cats', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xla1/v/t1.0-9/12274453_1514602302170800_6182234149956421731_n.jpg?oh=eb827a88d44932d01af59558bf9197c6&oe=5758A76F'))
	Event.create(name: "The Earthlings", description: 'Hi-tech psychadelic space-pop. Band members vary.', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xta1/t31.0-8/12185462_1012861118775622_4058638216889817257_o.jpg'))
	Event.create(name: "Owls, Foxes, and Sebastian", description: 'Listen if you like the idea of Morrisey replacing Julian Casablancas, with saxophone solos', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-ash2/t31.0-8/10548205_549534791817567_5595275718551706956_o.jpg'))
	Event.create(name: "Little Red Wolf", description: 'LRW need no introduction or amplification. This all-star team of instrumentalists trade off leading and harmony vocals on their rustic folk-pop songs', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xpf1/t31.0-8/11001607_10152519704366841_4219366653452069664_o.jpg'))
	Event.create(name: "The Wells Division", description: 'Folk rock richly layered with accordion, organ, and ', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xfa1/t31.0-8/11154823_948960675166970_4254027367253650707_o.jpg'))
	Event.create(name: "Wood Chickens", description: 'Raucous Bluegrass Punk. Punkgrass? Sure!', venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xlf1/v/t1.0-9/12661907_1286021244758124_4882574636361096691_n.jpg?oh=572bd2117282625f8fe127129d2c994d&oe=575515ED'))
	Event.create(name: "Skyline Sounds", description: "Indie rock that is definitely not emo", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xlf1/t31.0-8/10473339_343270732548480_8195706922969621057_o.jpg'))
	Event.create(name: "The Ferns", description: "Combines surf and prog influences with post-punk", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/12112303_896846573730527_5226291672877323791_n.jpg?oh=3980df71b559a4224c9d966dd8c0d8e7&oe=578F17CA'))
	Event.create(name: "Heavy Looks", description: "Some might say power-pop, some might say pop-punk, the latter are wrong", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xlf1/v/t1.0-9/7391_314386558689557_2102032215_n.png?oh=8fc450945bc84588bdb4c464e2da4f17&oe=57572AB8'))
	Event.create(name: "The Civil Engineers", description: "The question is not whether they will funk, but rather, how much funk they will funk the funk", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xlp1/t31.0-8/12771977_1152292944789274_2733328629601893800_o.jpg'))
	Event.create(name: "The Werewolverine", description: "Indie folk that wouldn't disturb a woodland creature's hibernation", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/12745774_610616735758840_2033131121576127179_n.jpg?oh=6ae2e301afd50e9a5d1d9a3300ccadfb&oe=5794D052'))
	Event.create(name: "Cats on Leashes", description: "They'll show up and play some punk songs", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xla1/v/t1.0-9/12299266_834453906668563_1709396690049002358_n.jpg?oh=032302a9e5690f8a9eaf1b9b7c0d5969&oe=575A9D33'))
	Event.create(name: "Pollinators", description: "Covering the ground between post-rock and power-pop", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/12438950_570673909752714_1798349019206091871_n.jpg?oh=6093c3e5c2e98421f1b5a21fa787fe5e&oe=574BA427'))
	Event.create(name: "Sexy Ester", description: "Because you really do want some sassy new wave in your life", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xft1/t31.0-8/10452956_909297485774852_894095720820105580_o.jpg'))
	Event.create(name: "Oh My Love", description: "This group has gone from ukulele-driven indie-pop to triphop and dubstep", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/12122424_1617268638526523_2813590903684172167_n.jpg?oh=977403ba5ef0306675bbd6e5cf7ba802&oe=5757D46A'))
	Event.create(name: "Lords of the Trident", description: "What other power metal band sends you valentines and arms you with battle axes", venue: venues.pop, date: Date.today+i, start_time: Faker::Time.forward, end_time: Faker::Time.forward, photo: File.open('https://scontent-ord1-1.xx.fbcdn.net/hphotos-xaf1/t31.0-8/11406545_10153476763604427_2097324136002184425_o.jpg'))
end

600.times do
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
	Friendship.create(user_id: user_id, friend_id: friend_id)
	Friendship.create(user_id: friend_id, friend_id: user_id)
end
# Randos go to events
4500.times do
	Rsvp.find_or_create_by(event: Event.all.sample, user: User.all.sample)
end

# Madison venues

600.times do
	Event.all.sample.tags << Tag.all.sample
end

