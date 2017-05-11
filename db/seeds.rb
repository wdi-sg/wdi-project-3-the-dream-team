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

6.times do |i|
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

@user.crafter = Crafter.create(
  name: Faker::Name.name,
  biography: Faker::StarWars.quote,
  category_id: rand(Category.all.length) + 1,
  profession: Faker::Superhero.name
)
p 'crafter creation succeeded'

@user.crafter.portfolio_items << PortfolioItem.create(
  media_link: 'nvmjtd2ugqd8ebmhqyvq.png',
  description: Faker::StarWars.quote,
  item_type: rand(9) + 1
)

@user.crafter.portfolio_items << PortfolioItem.create(
  media_link: 'nm282bppdphq72jegebj.png',
  description: Faker::StarWars.quote,
  item_type: 'image'
)

@user.crafter.portfolio_items << PortfolioItem.create(
  media_link: 'qmgkojbzj4yadohhltfb.png',
  description: Faker::StarWars.quote,
  item_type: 'image'
)
p 'portfolio items creation succeeded'


# Featured event and crafter data
#
#
@crafter = Crafter.find(1)
@crafter.update(
  name: Faker::Name.name,
  biography: 'WoodCrafter',
  category_id: 1,
  profession: 'WoodCrafter',
  profilePic_link: 'y9e6qmiuhdnbqmsrmprb.png'
)
@crafter.featured_crafter = FeaturedCrafter.create(
  media_link: 'y9e6qmiuhdnbqmsrmprb.png',
  description: 'WoodCrafter'
)

@event = Event.create(
  crafter_id: @crafter.id,
  name: 'Wood Class',
  description: 'Woodcraft Class',
  category_id: 1,
  image_link: 'mhsexj3uisrorctpnrpn.png'
)

@event.featured_event = FeaturedEvent.create(
  media_link: 'mhsexj3uisrorctpnrpn.png',
  description: 'Woodcraft Class',
)

# 2

@crafter = Crafter.find(2)
@crafter.update(
  name: Faker::Name.name,
  biography: 'Pottery Artist',
  category_id: 16,
  profession: 'Pottery Artist',
  profilePic_link: 'intubjdowdvhboctkspe.png'
)

@crafter.featured_crafter = FeaturedCrafter.create(
  media_link: 'intubjdowdvhboctkspe.png',
  description: 'Pottery Artist'
)

@event = Event.create(
  crafter_id: @crafter.id,
  name: 'Pottery Workshop',
  description: 'Pottery Workshop',
  category_id: 16,
  image_link: 'qdxiwyq9dfmi33jg3lk3.png'
)

@event.featured_event = FeaturedEvent.create(
  media_link: 'qdxiwyq9dfmi33jg3lk3.png',
  description: 'Pottery Artist',
)

# 3
#
@crafter = Crafter.find(3)
@crafter.update(
  name: 'Jill',
  biography: 'Papercraft Artist',
  category_id: 2,
  profession: 'Papercraft Artist',
  profilePic_link: 'nkiluhdga8otwpw9we6r.png'
)

@crafter.featured_crafter = FeaturedCrafter.create(
  media_link: 'nkiluhdga8otwpw9we6r.png',
  description: 'Papaercraft Artist'
)

@event = Event.create(
  crafter_id: @crafter.id,
  name: 'Papercraft Workshop',
  description: 'Papercraft Workshop',
  category_id: 2,
  image_link: 'Jo46vme9sg4ro4xyc1ta.png'
)

@event.featured_event = FeaturedEvent.create(
  media_link: 'Jo46vme9sg4ro4xyc1ta.png',
  description: 'Papercraft Workshop'
)


# 4
#
@crafter = Crafter.find(4)
@crafter.update(
  name: Faker::Name.name,
  biography: 'Photographer',
  category_id: 9,
  profession: 'Photographer',
  profilePic_link: 'Mqds89qbgxf3ru3nffyy.png'
)

@crafter.featured_crafter = FeaturedCrafter.create(
  media_link: 'Mqds89qbgxf3ru3nffyy.png',
  description: 'Photographer'
)

@event = Event.create(
  crafter_id: @crafter.id,
  name: 'Photography Workshop',
  description: 'Photography Workshop',
  category_id: 9,
  image_link: 'Sgqmdupqzm1hrtzul1do.png'
)

@event.featured_event = FeaturedEvent.create(
  media_link: 'Sgqmdupqzm1hrtzul1do.png',
  description: 'Photography Workshop'
)

# 5
#
@crafter = Crafter.find(5)
@crafter.update(
  name: 'Foo Shirong',
  biography: 'Classical and contemporary violinist',
  category_id: 9,
  profession: 'Musician',
  profilePic_link: '.png'
)

@crafter.featured_crafter = FeaturedCrafter.create(
  media_link: '.png',
  description: 'Musician'
)

@event = Event.create(
  crafter_id: @crafter.id,
  name: 'Jazz violin class for beginners',
  description: 'PMusic Class',
  category_id: 9,
  image_link: 'Kvkjhiowexkroc6sxfrz.png'
)

@event.featured_event = FeaturedEvent.create(
  media_link: 'Kvkjhiowexkroc6sxfrz.png',
  description: 'Music Class'
)

@sessions = Session.create(
[
  {
    :datetime_from => DateTime.strptime("05/12/2017 17:00", "%m/%d/%Y %H:%M"),
    :datetime_to => DateTime.strptime("05/12/2017 19:00", "%m/%d/%Y %H:%M"),
    price: 10,
    capacity: rand(10) + 1,
    pax: 0
  },
  {
    :datetime_from => DateTime.strptime("05/13/2018 17:00", "%m/%d/%Y %H:%M"),
    :datetime_to => DateTime.strptime("05/13/2018 19:00", "%m/%d/%Y %H:%M"),
    price: 10,
    capacity: rand(10) + 1,
    pax: 0
  }
]
)

p 'session creation succeeded'

@event.sessions << @sessions

# 6
#
@crafter = Crafter.find(6)
@crafter.update(
  name: 'Seth Loh',
  biography: 'Trouble Maker at OneMaker Group Pte Ltd',
  category_id: 8,
  profession: 'Maker',
  profilePic_link: 'Wckb9qj73vj3zwfexva3.png'
)

@crafter.featured_crafter = FeaturedCrafter.create(
  media_link: 'Wckb9qj73vj3zwfexva3.png',
  description: 'Maker'
)

@event = Event.create(
  crafter_id: @crafter.id,
  name: '3D Printing Workshop',
  description: '3D Printing Workshop',
  category_id: 8,
  image_link: 'Krbstddhst6qku1vy1ee.png'
)

@event.featured_event = FeaturedEvent.create(
  media_link: 'Krbstddhst6qku1vy1ee.png',
  description: '3D Printing Workshop'
)
