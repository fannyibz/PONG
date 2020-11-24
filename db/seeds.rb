# -------------------------- FIRST SEED -------------------------

puts "> Deleting all records..."
EventUser.destroy_all
Event.destroy_all
Friendship.destroy_all
User.destroy_all

# ------------- HEROES -------------

puts "> Creating users..."

# Hadrien
hadrien = User.new(first_name: 'Hadrien', last_name: 'Le Bret', email: "hadrien@gmail.com", password: "123456")

# file = URI.open("https://img.lemde.fr/2012/07/07/15/292.30846792291/465.35839543596/310.23363729625/688/0/60/0/ill_1729361_c0b3_201207071.0.988834193face_batman_ori.jpg")
# batman.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
hadrien.save!

puts "#{hadrien.first_name} created!"

# Fanny
fanny = User.new(first_name: 'Fanny', last_name: 'Ibanez', email: "fanny@gmail.com", password: "123456")

# file = URI.open("https://i.pinimg.com/originals/cb/9f/37/cb9f37eaf4205b8335d60c6cb91b0925.jpg")
# superman.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
fanny.save!

puts "#{fanny.first_name} created!"

friendship1 = Friendship.new(user: hadrien, friend: fanny)
friendship1.save!

puts "#{fanny.first_name} is friend with #{hadrien.first_name}!"

# Raphaël
raphael = User.new(first_name: 'Raphaël', last_name: 'Allard', email: "raphaël@gmail.com", password: "123456")

# file = URI.open("https://i.pinimg.com/originals/cb/9f/37/cb9f37eaf4205b8335d60c6cb91b0925.jpg")
# superman.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
raphael.save!

puts "#{raphael.first_name} created!"

friendship2 = Friendship.new(user: hadrien, friend: raphael)
friendship2.save!

puts "#{raphael.first_name} is friend with #{hadrien.first_name}!"

# Magali
magali = User.new(first_name: 'Magali', last_name: 'Rousseau', email: "magali@gmail.com", password: "123456")

# file = URI.open("https://i.pinimg.com/originals/cb/9f/37/cb9f37eaf4205b8335d60c6cb91b0925.jpg")
# superman.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg").save!
magali.save!

puts "#{magali.first_name} created!"

friendship3 = Friendship.new(user: hadrien, friend: magali)
friendship3.save!

puts "#{magali.first_name} is friend with #{hadrien.first_name}!"

puts "> Creating events..."

event1 = Event.new(emoji: "🍻",
                   address: "16 Villa Gaudelet, Paris",
                   date_time: DateTime.now,
                   description: "Come have a few drinks before lockdown",
                   open: false,
                   user: hadrien )
event1.save!

puts "#{event1.emoji}, hosted by #{event1.user.first_name} created!"

EventUser.create!(event: event1, user: fanny, status: "confirmed", role: "visitor")

EventUser.create!(event: event1, user: raphael, status: "pending", role: "visitor")

EventUser.create!(event: event1, user: magali, status: "declined", role: "visitor")

event2 = Event.new(emoji: "🍔",
                   address: "130 rue saint-denis, Paris",
                   date_time: DateTime.now + 2.hours,
                   description: "I'm veryyyy hungry!",
                   open: true,
                   user: fanny )

EventUser.create!(event: event2, user: hadrien, status: "confirmed", role: "partner")

puts "#{event2.emoji}, hosted by #{event2.user.first_name} created!"




