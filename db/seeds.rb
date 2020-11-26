# -------------------------- FIRST SEED -------------------------

puts "> Deleting all records..."

EventUser.destroy_all
Event.destroy_all
Friendship.destroy_all
# User.avatar.attach.destroy_all
User.destroy_all

# ------------- HEROES -------------

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
raphael = User.new(first_name: 'Raphaël', last_name: 'Allard', email: "raphaël@gmail.com", password: "123456")

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

puts "> Creating friendships..."

friendship1 = Friendship.new(user: hadrien, friend: fanny)
friendship1.save!

friendship2 = Friendship.new(user: hadrien, friend: raphael)
friendship2.save!

friendship3 = Friendship.new(user: hadrien, friend: magali)
friendship3.save!

puts "#{hadrien.first_name} is friend with #{fanny.first_name} etc!"

friendship4 = Friendship.new(user: fanny, friend: hadrien)
friendship4.save!

friendship5 = Friendship.new(user: fanny, friend: raphael)
friendship5.save!

friendship6 = Friendship.new(user: fanny, friend: magali)
friendship6.save!

puts "#{fanny.first_name} is friend with #{raphael.first_name} etc!"

friendship7 = Friendship.new(user: raphael, friend: hadrien)
friendship7.save!

friendship8 = Friendship.new(user: raphael, friend: fanny)
friendship8.save!

friendship9 = Friendship.new(user: raphael, friend: magali)
friendship9.save!

puts "#{raphael.first_name} is friend with #{magali.first_name} etc!"

friendship10 = Friendship.new(user: magali, friend: hadrien)
friendship10.save!

friendship11 = Friendship.new(user: magali, friend: fanny)
friendship11.save!

friendship12 = Friendship.new(user: magali, friend: raphael)
friendship12.save!

puts "#{magali.first_name} is friend with #{hadrien.first_name} etc!"

puts "> Creating events..."

event1 = Event.new(emoji: "🍺",
                   address: "16 Villa Gaudelet, Paris",
                   date_time: DateTime.now,
                   description: "Come have a few drinks before lockdown",
                   open: false,
                   user: hadrien,
                   status: "completed" )
event1.save!

puts "#{event1.emoji}, hosted by #{event1.user.first_name} created!"

# EventUser.create!(event: event1, user: hadrien, status: "confirmed", role: "host") #Added Hadrien as host even_user

EventUser.create!(event: event1, user: fanny, status: "confirmed", role: "visitor")

EventUser.create!(event: event1, user: raphael, status: "pending", role: "visitor")

EventUser.create!(event: event1, user: magali, status: "declined", role: "visitor")

event2 = Event.new(emoji: "🍔",
                   address: "130 rue saint-denis, Paris",
                   date_time: DateTime.now + 2.hours,
                   description: "I'm veryyyy hungry!",
                   open: true,
                   user: fanny,
                   status: "completed" )

EventUser.create!(event: event2, user: hadrien, status: "confirmed", role: "partner")

puts "#{event2.emoji}, hosted by #{event2.user.first_name} created!"




