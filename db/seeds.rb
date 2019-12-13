user = User.create!(
  name: "Pablo", 
  email: "pablo@example.com"
)

user.events.create!(
  description: "Future event",
  date: '2019-12-12'
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
  users.each do |u|
    u.events.create!(
      description: description,
      date: Time.now
    )
  end
end

events = Event.order(:created_at).take(6)

events.each do |e|
  users.each do |u|
    Attendance.create!(
      attended_event_id: e.id,
      attendee_id: u.id      
    )
  end
end