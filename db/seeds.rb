# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[Woodcraft Papercraft Jewellery Textiles Drawing Painting Sculpture Printmaking Photography Calligraphy Leathermaking Musician Hairstylist Bookbinders Tattoo Pottery]
.each do |c|
  Category.create(name: c)
end

50.times do |i|
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
    category_id: rand(Category.all.length) + 1,
    profession: Faker::Superhero.name,
    profilePic_link: Faker::Avatar.image
  )
  p 'crafter creation succeeded'

  4.times do
    @user.crafter.events << Event.create(
      name: Faker::Commerce.product_name + ' class',
      description: Faker::StarWars.quote,
      category_id: rand(Category.all.length) + 1,
      image_link: Faker::Avatar.image
    )
  end

  p 'event creation succeeded'

  @sessions = Session.create(
  [
    {
      :datetime_from => DateTime.strptime("05/12/2017 17:00", "%m/%d/%Y %H:%M"),
      :datetime_to => DateTime.strptime("05/12/2017 19:00", "%m/%d/%Y %H:%M"),
      price: rand(100) + 1,
      capacity: rand(100) + 1,
      pax: 0
    },
    {
      :datetime_from => DateTime.strptime("05/13/2018 17:00", "%m/%d/%Y %H:%M"),
      :datetime_to => DateTime.strptime("05/13/2018 19:00", "%m/%d/%Y %H:%M"),
      price: rand(100) + 1,
      capacity: rand(100) + 1,
      pax: 0
    }
  ]
  )

  p 'session creation succeeded'

  @user.crafter.events.each do |event|
    event.sessions << @sessions
  end

  p 'pushed session into event successfully'

  @bookings = Booking.create(
    craftee_id: i,
    session_id: rand(7) + 1,
    status: 'confirmed',
    pax: rand(7) + 1,
    amount: rand(50) + 1
  )
  p 'booking creation succeeded'

  @user.craftee.bookings << @bookings
  p 'pushed bookings into craftee booking'

end
# loop ends here
# below User created will be used by Tom to Log In at browser for testing
@user = User.create(
  email: 'crafter@mail.com',
  password: '123456'
)

p 'user creation succeeded'

@user.crafter = Crafter.create(
  name: Faker::Name.name,
  biography: Faker::StarWars.quote,
  category_id: rand(Category.all.length) + 1,
  profession: Faker::Superhero.name
)
p 'crafter creation succeeded'

@user.crafter.events << Event.create(
  name: Faker::Commerce.product_name + ' class',
  description: Faker::StarWars.quote,
  category_id: rand(Category.all.length) + 1,
  image_link: Faker::Avatar.image
)

p 'event creation succeeded'

@user.craftee = Craftee.create

@user = User.create(
  email: 'craftee@mail.com',
  password: '123456'
)

p 'user creation succeeded'

@user.crafter = Crafter.create(
  name: Faker::Name.name,
  biography: Faker::StarWars.quote,
  category_id: rand(Category.all.length) + 1,
  profession: Faker::Superhero.name
)
p 'crafter creation succeeded'

@user.crafter.events << Event.create(
  name: Faker::Commerce.product_name + ' class',
  description: Faker::StarWars.quote,
  category_id: rand(Category.all.length) + 1
)

p 'event creation succeeded'

@user.craftee = Craftee.create



@user.crafter = Crafter.create(
  name: Faker::Name.name,
  biography: Faker::StarWars.quote,
  category_id: rand(Category.all.length) + 1,
  profession: Faker::Superhero.name
)
p 'crafter creation succeeded'

@user.crafter.portfolio_items << PortfolioItem.create(
  media_link: 'featuredEvents1.png',
  description: Faker::StarWars.quote,
  item_type: rand(9) + 1
)

@user.crafter.portfolio_items << PortfolioItem.create(
  media_link: 'featuredEvents2.png',
  description: Faker::StarWars.quote,
  item_type: 'image'
)

@user.crafter.portfolio_items << PortfolioItem.create(
  media_link: 'featuredEvents3.png',
  description: Faker::StarWars.quote,
  item_type: 'image'
)
p 'portfolio items creation succeeded'
