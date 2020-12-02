# -------------------------- FIRST SEED -------------------------

puts "> Deleting all records..."

EventUser.destroy_all
Event.destroy_all
Friendship.destroy_all
# User.avatar.attach.destroy_all
User.destroy_all

# ------------- HEROES -------------

#Groupes

puts "> Creating groupes..."

#skeasy
puts "> Creating groupes..."

skeasy = User.new(first_name: 'Skeasy', last_name: '...', email: "skeasy@gmail.com", password: "123456")

file = URI.open("https://pbs.twimg.com/profile_images/1195425467102302208/1dT2p3Cw.jpg")
skeasy.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
skeasy.save!

puts "#{skeasy.first_name} created!"

#----------------------------------------

puts "> Creating users..."

# Hadrien
hadrien = User.new(first_name: 'Hadrien', last_name: 'Le Bret', email: "hadrien@gmail.com", password: "123456")

file = URI.open("https://avatars1.githubusercontent.com/u/70147290?v=4.jpg")
hadrien.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
hadrien.save!

puts "#{hadrien.first_name} created!"

# Fanny
fanny = User.new(first_name: 'Fanny', last_name: 'Ibanez', email: "fanny@gmail.com", password: "123456")

file = URI.open("https://avatars0.githubusercontent.com/u/61230838?v=4.jpg")
fanny.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
fanny.save!

puts "#{fanny.first_name} created!"

# Raphaël
raphael = User.new(first_name: 'Raphaël', last_name: 'Allard', email: "raphael@gmail.com", password: "123456")

file = URI.open("https://avatars3.githubusercontent.com/u/67843990?v=4.jpg")
raphael.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
raphael.save!

puts "#{raphael.first_name} created!"

# Magali
magali = User.new(first_name: 'Magali', last_name: 'Rousseau', email: "magali@gmail.com", password: "123456")

file = URI.open("https://avatars3.githubusercontent.com/u/70401848?v=4.jpg")
magali.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
magali.save!

puts "#{magali.first_name} created!"

# Benjamin
benjamin = User.new(first_name: 'Benjamin', last_name: 'Barbier', email: "benjamin@gmail.com", password: "123456")

file = URI.open("https://avatars1.githubusercontent.com/u/67894778?v=4.jpg")
benjamin.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
benjamin.save!

puts "#{benjamin.first_name} created!"

# Joanna
joanna = User.new(first_name: 'Joanna', last_name: 'Chaillou', email: "joanna@gmail.com", password: "123456")

file = URI.open("https://avatars2.githubusercontent.com/u/69638927?v=4.jpg")
joanna.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
joanna.save!

puts "#{joanna.first_name} created!"

# Florence
florence = User.new(first_name: 'Florence', last_name: 'Chauve', email: "florence@gmail.com", password: "123456")

file = URI.open("https://avatars2.githubusercontent.com/u/71376422?v=4.jpg")
florence.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
florence.save!

puts "#{florence.first_name} created!"

# Sebastien
sebastien = User.new(first_name: 'Sebastien', last_name: 'Chauve', email: "sebastien@gmail.com", password: "123456")

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1558950804/lxpghuy9ljoa9mcwrrby.jpg")
sebastien.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
sebastien.save!

puts "#{sebastien.first_name} created!"

# Julien
julien = User.new(first_name: 'Julien', last_name: 'Da Silva', email: "julien@gmail.com", password: "123456")

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1583184888/ejcrzhnuyoeoljzap3ru.jpg")
julien.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
julien.save!

puts "#{julien.first_name} created!"

# Edouard
edouard = User.new(first_name: 'Edouard', last_name: 'Foussier', email: "edouard@gmail.com", password: "123456")

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1535710792/jwfoxmnm29vxuny3vmxi.jpg")
edouard.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
edouard.save!

puts "#{edouard.first_name} created!"

# Maximin
maximin = User.new(first_name: 'Maximin', last_name: 'D’audiffret', email: "maximin@gmail.com", password: "123456")

file = URI.open("https://avatars0.githubusercontent.com/u/25780743?v=4.jpg")
maximin.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
maximin.save!

puts "#{maximin.first_name} created!"


# Nicolas
nicolas = User.new(first_name: 'Nicolas', last_name: 'Constantin', email: "nicolas@gmail.com", password: "123456")

file = URI.open("https://avatars2.githubusercontent.com/u/72381271?v=4.jpg")
nicolas.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
nicolas.save!

puts "#{nicolas.first_name} created!"

# Gael
gael = User.new(first_name: 'Gael', last_name: 'Gendre', email: "gael@gmail.com", password: "123456")

file = URI.open("https://avatars3.githubusercontent.com/u/13021748?v=4.jpg")
gael.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
gael.save!

puts "#{gael.first_name} created!"

# Nicolas2
nicolas2 = User.new(first_name: 'Nicolas', last_name: 'Le Bechec De Redon', email: "nicolas2@gmail.com", password: "123456")

file = URI.open("https://avatars3.githubusercontent.com/u/71632407?v=4.jpg")
nicolas2.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
nicolas2.save!

puts "#{nicolas2.first_name} created!"

# Chiara
chiara = User.new(first_name: 'Chiara', last_name: 'De Montlaur', email: "chiara@gmail.com", password: "123456")

file = URI.open("https://avatars0.githubusercontent.com/u/70749428?v=4.jpg")
chiara.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
chiara.save!

puts "> Creating friendships..."

friendship_g2 = Friendship.new(user: hadrien, friend: skeasy, status: "approved")
friendship_g2.save!

friendship1 = Friendship.new(user: hadrien, friend: fanny, status: "approved")
friendship1.save!

friendship2 = Friendship.new(user: hadrien, friend: raphael, status: "approved")
friendship2.save!

friendship3 = Friendship.new(user: hadrien, friend: magali, status: "approved")
friendship3.save!

friendship13 = Friendship.new(user: hadrien, friend: benjamin, status: "approved")
friendship13.save!

friendship14 = Friendship.new(user: hadrien, friend: joanna, status: "approved")
friendship14.save!

friendship15 = Friendship.new(user: hadrien, friend: florence, status: "approved")
friendship15.save!

friendship37 = Friendship.new(user: hadrien, friend: sebastien, status: "approved")
friendship37.save!

friendship38 = Friendship.new(user: hadrien, friend: julien, status: "approved")
friendship38.save!

friendship39 = Friendship.new(user: hadrien, friend: edouard, status: "approved")
friendship39.save!

friendship58 = Friendship.new(user: hadrien, friend: maximin, status: "approved")
friendship58.save!

friendship67 = Friendship.new(user: hadrien, friend: nicolas, status: "approved")
friendship67.save!

friendship78 = Friendship.new(user: hadrien, friend: chiara, status: "approved")
friendship78.save!

friendship79 = Friendship.new(user: hadrien, friend: nicolas2, status: "approved")
friendship79.save!

friendship80 = Friendship.new(user: hadrien, friend: gael, status: "approved")
friendship80.save!

puts "#{hadrien.first_name} is friend with #{fanny.first_name} etc!"

friendship_g4 = Friendship.new(user: fanny, friend: skeasy, status: "approved")
friendship_g4.save!

friendship4 = Friendship.new(user: fanny, friend: hadrien, status: "approved")
friendship4.save!

friendship5 = Friendship.new(user: fanny, friend: raphael, status: "approved")
friendship5.save!

friendship6 = Friendship.new(user: fanny, friend: magali, status: "approved")
friendship6.save!

friendship16 = Friendship.new(user: fanny, friend: benjamin, status: "approved")
friendship16.save!

friendship17 = Friendship.new(user: fanny, friend: joanna, status: "approved")
friendship17.save!

friendship18 = Friendship.new(user: fanny, friend: florence, status: "approved")
friendship18.save!

friendship40 = Friendship.new(user: fanny, friend: sebastien, status: "approved")
friendship40.save!

friendship41 = Friendship.new(user: fanny, friend: julien, status: "approved")
friendship41.save!

friendship42 = Friendship.new(user: fanny, friend: edouard, status: "approved")
friendship42.save!

friendship59 = Friendship.new(user: fanny, friend: maximin, status: "approved")
friendship59.save!

friendship70 = Friendship.new(user: fanny, friend: nicolas, status: "approved")
friendship70.save!

friendship81 = Friendship.new(user: fanny, friend: chiara, status: "approved")
friendship81.save!

friendship82 = Friendship.new(user: fanny, friend: nicolas2, status: "approved")
friendship82.save!

friendship83 = Friendship.new(user: fanny, friend: gael, status: "approved")
friendship83.save!

puts "#{fanny.first_name} is friend with #{raphael.first_name} etc!"

friendship_g6 = Friendship.new(user: raphael, friend: skeasy, status: "approved")
friendship_g6.save!

friendship7 = Friendship.new(user: raphael, friend: hadrien, status: "approved")
friendship7.save!

friendship8 = Friendship.new(user: raphael, friend: fanny, status: "approved")
friendship8.save!

friendship9 = Friendship.new(user: raphael, friend: magali, status: "approved")
friendship9.save!

friendship19 = Friendship.new(user: raphael, friend: benjamin, status: "approved")
friendship19.save!

friendship20 = Friendship.new(user: raphael, friend: joanna, status: "approved")
friendship20.save!

friendship21 = Friendship.new(user: raphael, friend: florence, status: "approved")
friendship21.save!

friendship44 = Friendship.new(user: raphael, friend: sebastien, status: "approved")
friendship44.save!

friendship45 = Friendship.new(user: raphael, friend: julien, status: "approved")
friendship45.save!

friendship46 = Friendship.new(user: raphael, friend: edouard, status: "approved")
friendship46.save!

friendship60 = Friendship.new(user: raphael, friend: maximin, status: "approved")
friendship60.save!

friendship73 = Friendship.new(user: raphael, friend: nicolas, status: "approved")
friendship73.save!

friendship84 = Friendship.new(user: raphael, friend: chiara, status: "approved")
friendship84.save!

friendship85 = Friendship.new(user: raphael, friend: nicolas2, status: "approved")
friendship85.save!

friendship86 = Friendship.new(user: raphael, friend: gael, status: "approved")
friendship86.save!

puts "#{raphael.first_name} is friend with #{magali.first_name} etc!"

friendship_g8 = Friendship.new(user: magali, friend: skeasy, status: "approved")
friendship_g8.save!

friendship10 = Friendship.new(user: magali, friend: hadrien, status: "approved")
friendship10.save!

friendship11 = Friendship.new(user: magali, friend: fanny, status: "approved")
friendship11.save!

friendship12 = Friendship.new(user: magali, friend: raphael, status: "approved")
friendship12.save!

friendship22 = Friendship.new(user: magali, friend: benjamin, status: "approved")
friendship22.save!

friendship23 = Friendship.new(user: magali, friend: joanna, status: "approved")
friendship23.save!

friendship24 = Friendship.new(user: magali, friend: florence, status: "approved")
friendship24.save!

friendship47 = Friendship.new(user: magali, friend: sebastien, status: "approved")
friendship47.save!

friendship48 = Friendship.new(user: magali, friend: julien, status: "approved")
friendship48.save!

friendship49 = Friendship.new(user: magali, friend: edouard, status: "approved")
friendship49.save!

friendship61 = Friendship.new(user: magali, friend: maximin, status: "approved")
friendship61.save!

friendship76 = Friendship.new(user: magali, friend: nicolas, status: "approved")
friendship76.save!

friendship87 = Friendship.new(user: magali, friend: chiara, status: "approved")
friendship87.save!

friendship88 = Friendship.new(user: magali, friend: nicolas2, status: "approved")
friendship88.save!

friendship89 = Friendship.new(user: magali, friend: gael)
friendship89.save!

puts "#{magali.first_name} is friend with #{hadrien.first_name} etc!"

friendship_g10 = Friendship.new(user: benjamin, friend: skeasy, status: "approved")
friendship_g10.save!

friendship25 = Friendship.new(user: benjamin, friend: fanny, status: "approved")
friendship25.save!

friendship26 = Friendship.new(user: benjamin, friend: raphael, status: "approved")
friendship26.save!

friendship27 = Friendship.new(user: benjamin, friend: magali, status: "approved")
friendship27.save!

friendship28 = Friendship.new(user: benjamin, friend: hadrien, status: "approved")
friendship28.save!

friendship29 = Friendship.new(user: benjamin, friend: joanna, status: "approved")
friendship29.save!

friendship30 = Friendship.new(user: benjamin, friend: florence, status: "approved")
friendship30.save!

friendship50 = Friendship.new(user: benjamin, friend: sebastien, status: "approved")
friendship50.save!

friendship51 = Friendship.new(user: benjamin, friend: julien, status: "approved")
friendship51.save!

friendship52 = Friendship.new(user: benjamin, friend: edouard, status: "approved")
friendship52.save!

friendship62 = Friendship.new(user: benjamin, friend: maximin, status: "approved")
friendship62.save!

puts "#{benjamin.first_name} is friend with #{fanny.first_name} etc!"


puts "> Creating events..."

event1 = Event.new(emoji: "🤓",
                   address: "16 Villa Gaudelet, Paris",
                   date_time: DateTime.now,
                   description: "Let's do some more coding!",
                   open: false,
                   user: raphael,
                   status: "completed" )
event1.save!

puts "#{event1.emoji}, hosted by #{event1.user.first_name} created!"

# EventUser.create!(event: event1, user: hadrien, status: "confirmed", role: "host") #Added Hadrien as host even_user

EventUser.create!(event: event1, user: hadrien, status: "pending", role: "visitor")

EventUser.create!(event: event1, user: joanna, status: "confirmed", role: "visitor")

EventUser.create!(event: event1, user: magali, status: "declined", role: "visitor")

event2 = Event.new(emoji: "🍺",
                   address: "130 rue saint-denis, Paris",
                   date_time: DateTime.now + 2.hours,
                   description: "I'm veryyyy hungry!",
                   open: true,
                   user: fanny,
                   status: "completed" )

EventUser.create!(event: event2, user: chiara, status: "confirmed", role: "partner")
EventUser.create!(event: event2, user: hadrien, status: "pending", role: "partner")
EventUser.create!(event: event2, user: magali, status: "confirmed", role: "partner")
EventUser.create!(event: event2, user: edouard, status: "pending", role: "partner")
EventUser.create!(event: event2, user: nicolas, status: "declined", role: "partner")
EventUser.create!(event: event2, user: florence, status: "pending", role: "partner")
EventUser.create!(event: event2, user: raphael, status: "declined", role: "partner")
EventUser.create!(event: event2, user: nicolas2, status: "confirmed", role: "partner")

puts "#{event2.emoji}, hosted by #{event2.user.first_name} created!"




