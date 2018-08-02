# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'kaherreras@unal.edu.co', role: 'Admin', name: 'Kevin Andrey Herrera Silva', password: '123456', password_confirmation: '123456')
User.create(email: 'viviana.arango1505@gmail.com', role: 'Admin', name: 'Claudia Viviana Arango Grisales', password: '123456', password_confirmation: '123456')
puts "DefectoOk"