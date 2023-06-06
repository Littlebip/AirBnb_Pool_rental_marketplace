require 'faker'

Pool.destroy_all

SIZES = ["small", "medium", "large"]

# user = User.create(username:"bob", email: "bob@gmail.com", password:"1234567")
15.times do
  address = Faker::Address.full_address
  size = SIZES.sample
  price = rand(0..1000000)

  pool = Pool.create!(
    address: address,
    size: size,
    price: price,
    user_id: 1
  )

  puts "Created pools #{pool.address}"
end
