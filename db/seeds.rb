# frozen_string_literal: true
puts "Seeding..."

user = User.new(email: 'leo@gmail.com', password: '123456', password_confirmation: '123456')
user.save
puts "Seeding done."