require 'faker'

puts "Cleaning database..."
Pool.destroy_all

SIZES = ["small", "medium", "large"]

puts "Creating users..."
@user_ayub = User.create(username: "ayub", email: "ayub@gmail.com", password: "123456")
@user_lucile = User.create(username: "lucile", email: "lucile@gmail.com", password: "123456")
@user_shuqi = User.create(username: "shuqi", email: "shuqi@gmail.com", password: "123456")
@user_elisa = User.create(username: "elisa", email: "elisa@gmail.com", password: "123456")

puts "Creating pools..."
15.times do
  @title = "#{Faker::Color.color_name.capitalize} pool with #{Faker::House.furniture}s"
  @address = Faker::Address.full_address
  @size = SIZES.sample
  @price = rand(70..250)
  @details = "The water in the pool is blue as the sky and clean as the crystal. The cool blue water of the pool is refreshing mind and body."
  @images = [url("https://source.unsplash.com/random/?pool,sun"), url("https://source.unsplash.com/random/?pool,cocktail"), url("https://source.unsplash.com/random/?pool")]
  @user_id_array = [@user_ayub.id, @user_lucile.id, @user_shuqi.id, @user_elisa.id]

  pool = Pool.create!(
    title: @title,
    address: @address,
    size: @size,
    price: @price,
    user_id: @user_id_array.sample,
    details: @details,
    images: @images
  )

  puts "Created pool #{pool.title}"
end

puts "Seeding finished! Pools id start from #{Pool.first.id}!"
