# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Creating prices with a time between today and yesterday"
price_array = (100..10000).to_a
time_array = (Time.new(2022, 12, 3).to_i..Time.new(2022, 12, 4).to_i).to_a

10000.times do
  Price.create!(value: price_array.sample, time: Time.at(time_array.sample))
end

puts "Prices created !"