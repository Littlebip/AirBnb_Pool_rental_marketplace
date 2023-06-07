require 'faker'

puts "Cleaning database..."
Pool.destroy_all

SIZES = ["small", "medium", "large"]

puts "Creating users..."
User.create(username: "ayub", email: "ayub@gmail.com", password: "123456")
User.create(username: "lucile", email: "lucile@gmail.com", password: "123456")
User.create(username: "shuqi", email: "shuqi@gmail.com", password: "123456")
User.create(username: "elisa", email: "elisa@gmail.com", password: "123456")

puts "Creating pools..."
15.times do
  @title = "#{Faker::Color.color_name} pool with #{Faker::Marketing.buzzwords}"
  @address = Faker::Address.full_address
  @size = SIZES.sample
  @price = rand(0..1_000_000)

  pool = Pool.create!(
    title: @title,
    address: @address,
    size: @size,
    price: @price,
    user_id: rand(1..4)
  )

  puts "Created pool #{pool.title}"
end

puts "Seeding finished! Pools id start from #{Pool.first.id}!"
