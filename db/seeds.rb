# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(
  name: "Pablo", 
  email: "pablo@example.com"
)

Event.create!(
  creator: user, 
  description: "Pepe's birthday",
  date: "2019-22-08 20:00:00"
)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  User.create!(
    name:  name,
    email: email   
    )
end

users = User.order(:created_at).take(6)

50.times do
  description = Faker::Superhero.name+"'s promotion to "+Faker::Military.air_force_rank
  users.each { |user| 
      event = Event.new(creator: user, description: description, date: Time.now)
      #user.events.create!(description: description) -> How to do it this way?
  }
end

