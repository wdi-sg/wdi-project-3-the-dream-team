# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  Category.create(name: Faker::Job.field)
end

5.times do |i|
  @user = User.create(
    # email: Faker::Internet.email,
    # password: Faker::Internet.password
    email: 'testuser' + (i+1).to_s + '@gmail.com',
    password: 'password'
  )
  p 'user creation succeeded'

  @user.craftee = Craftee.create(
  name: Faker::Name.name
  )
  p 'craftee creation succeeded'

  @user.crafter = Crafter.create(
    name: Faker::Name.name,
    biography: Faker::StarWars.quote,
    category_id: rand(9),
    profession: Faker::Superhero.name
  )
  p 'crafter creation succeeded'

  @user.crafter.events << Event.create(
    name: Faker::Commerce.product_name + ' class',
    description: Faker::StarWars.quote,
    category_id: rand(9)

  )
  @user.crafter.events << Event.create(
    name: Faker::Commerce.product_name + ' class',
    description: Faker::StarWars.quote,
    category_id: rand(9)
  )
  p 'event creation succeeded'

  @sessions = Session.create(
  [
    {
      :datetime_from => DateTime.strptime("05/12/2017 17:00", "%m/%d/%Y %H:%M"),
      :datetime_to => DateTime.strptime("05/12/2017 19:00", "%m/%d/%Y %H:%M"),
      price: rand(100),
      capacity: rand(100)
    },
    {
      :datetime_from => DateTime.strptime("05/13/2018 17:00", "%m/%d/%Y %H:%M"),
      :datetime_to => DateTime.strptime("05/13/2018 19:00", "%m/%d/%Y %H:%M"),
      price: rand(100),
      capacity: rand(100)
    }
  ]
  )

  p 'session creation succeeded'

  @user.crafter.events.each do |event|
    event.sessions << @sessions
  end

  p 'pushed session into event successfully'

  @bookings = Booking.create(
    status: 'status'
  )
  p 'booking creation succeeded'

  @user.craftee.bookings << @bookings

  p 'pushed bookings into craftee booking'


end
