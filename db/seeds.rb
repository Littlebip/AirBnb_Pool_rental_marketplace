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
counter = 1
5.times do
  #@title = "#{Faker::Color.color_name.capitalize} pool with #{Faker::House.furniture}s"
  @title = "Amazing pool!#{counter}"
  @address = "southampton"
  @size = SIZES.sample
  @price = rand(70..250)
  @details = "The water in the pool is blue as the sky and clean as the crystal. The cool blue water of the pool is refreshing mind and body."
  #@images = [url("https://source.unsplash.com/random/?pool,sun"), url("https://source.unsplash.com/random/?pool,cocktail"), url("https://source.unsplash.com/random/?pool")]
  counter += 1

  pool = Pool.create(
    title: @title,
    address: @address,
    size: @size,
    price: @price,
    user_id: rand(1..4),
    details: @details,
    #images: @images
  )

  puts "Created pool #{pool.title}"
end

puts "Seeding finished! Pools id start from #{Pool.first.id}!"
