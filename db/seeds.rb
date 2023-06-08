require 'faker'
require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Pool.destroy_all

SIZES = ["small", "medium", "large"]
DESC_TITLE = ["Cute little swimming pool in the middle of the forest", "The best playground for all pet lovers!", "Quiet swimming pool retreat", "Fun urban pool with many toys available", "The best pool of the city!", "Waterfall pool on the seaside", "Medium-sized pool for young and old", "Countryside garden pool to rent!", "Homestay comfortable and fun, with a great pool!", "Amazing rooftop pool!"]
DESC_DETAILS = ["The water in the pool is blue as the sky.", "The cool blue water of the pool is refreshing mind and body.", "Come and enjoy a nice and free time in our pool!"]

puts "Creating users..."
@user_ayub = User.create(username: "ayub", email: "ayub@gmail.com", password: "123456")
@user_lucile = User.create(username: "lucile", email: "lucile@gmail.com", password: "123456")
@user_shuqi = User.create(username: "shuqi", email: "shuqi@gmail.com", password: "123456")
@user_elisa = User.create(username: "elisa", email: "elisa@gmail.com", password: "123456")

puts "Creating pools..."

@file1 = URI.open("https://images.unsplash.com/photo-1498747946579-bde604cb8f44?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9vbHxlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=500&q=60")
@file2 = URI.open("https://images.unsplash.com/photo-1551672746-89991811c186?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG9vbHxlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=500&q=60")
@file3 = URI.open("https://images.unsplash.com/photo-1575429198097-0414ec08e8cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=500&q=60")
@file4 = URI.open("https://images.unsplash.com/photo-1614667288602-9ac6e37318a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")
@file5 = URI.open("https://images.unsplash.com/photo-1536745511564-a5fa6e596e7b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")
@file6 = URI.open("https://images.unsplash.com/photo-1504309092620-4d0ec726efa4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")
@file7 = URI.open("https://images.unsplash.com/photo-1623718649591-311775a30c43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")
@file8 = URI.open("https://images.unsplash.com/photo-1576336463225-18df4bee0e38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")
@file9 = URI.open("https://images.unsplash.com/photo-1613152184920-bc1c4ab7fd1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")
@file10 = URI.open("https://images.unsplash.com/photo-1621245700087-a8617f91cdbe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fHBvb2x8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=1000&q=60")

def create_pool(title_index, file_one)
  @title = DESC_TITLE[title_index]
  @address = Faker::Address.full_address
  @size = SIZES.sample
  @price = rand(70..250)
  @details = DESC_DETAILS.sample

  pool = Pool.new(
    title: @title,
    address: @address,
    size: @size,
    price: @price,
    user_id: rand(1..4),
    details: @details
  )

  pool.images.attach(io: file_one, filename: "pool#{title_index}.jpg", content_type: "image/jpg")
  # pool.images.attach(io: file_two, filename: "pool#{title_index}.jpg", content_type: "image/jpg")
  pool.save

  puts "Created pool #{pool.title}"
end

create_pool(0, @file10)
create_pool(1, @file1)
create_pool(2, @file3)
create_pool(3, @file5)
create_pool(4, @file7)
create_pool(5, @file9)
create_pool(6, @file2)
create_pool(7, @file4)
create_pool(8, @file6)
create_pool(9, @file8)

puts "Seeding finished! Pools ids start from #{Pool.first.id}!"
