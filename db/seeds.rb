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

5.times do
  @user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  p 'user creation succeeded'

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

  p 'event creation succeeded'

  @user.craftee = Craftee.create
end
# below User created will be used by Tom to login at browser for testing
@user = User.create(
  email: 'crafter@mail.com',
  password: '123456'
)

p 'user creation succeeded'

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
  category_id: rand(9),
  profession: Faker::Superhero.name
)
p 'crafter creation succeeded'

@user.crafter.events << Event.create(
  name: Faker::Commerce.product_name + ' class',
  description: Faker::StarWars.quote,
  category_id: rand(9)
)

p 'event creation succeeded'

@user.craftee = Craftee.create
