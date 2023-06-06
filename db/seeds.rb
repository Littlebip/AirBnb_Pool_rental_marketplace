require 'faker'

Pool.destroy_all

SIZES = ["small", "medium", "large"]

User.create(username: "ayub", email: "ayub@gmail.com", password: "123456")
User.create(username: "lucile", email: "lucile@gmail.com", password: "123456")
User.create(username: "shuqi", email: "shuqi@gmail.com", password: "123456")
User.create(username: "elisa", email: "elisa@gmail.com", password: "123456")

15.times do
  @address = Faker::Address.full_address
  @size = SIZES.sample
  @price = rand(0..1_000_000)

  pool = Pool.create!(
    address: @address,
    size: @size,
    price: @price,
    user_id: rand(1..4)
  )

  puts "Created pools #{pool.address}"
end
