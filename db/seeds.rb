# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# TODO: create admin user(s) here
require 'securerandom'

random_string = SecureRandom.hex(8)

robohash_url = 'https://robohash.org/#{random_string}.png?set=set4'

admin_password = ENV['TPP_ADMIN']
User.create(admin: true, avatar: robohash_url, email: 'amomprem@uillinois.edu', password: admin_password, username: 'amomprem')

# TODO: create retailer(s) here
