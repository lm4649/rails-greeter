# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'desrtoying user, cards and contributions'
# cards and contribution are destroyed along with their user
User.destroy_all

puts 'create 3 users : Micky, Marc and Samir'

User.create!(email: 'Micky@lewagon.com', password: 'greeter1234')
User.create!(email: 'Samir@lewagon.com', password: 'greeter1234')
User.create!(email: 'Marc@lewagon.com', password: 'greeter1234')

puts "#{User.count} users created"

puts 'adding cards and contributions for each user'

User.all.each do |user|
  # adding 10 cards to each user
  10.times do
    card = Card.create!(user: user, title: "#{Faker::Name.unique.first_name}'s birthday", event_date: Date.today + rand(1..15), description: "explaining here for who and for what event")
    # adding 5 contributions to each card, the 1st one is the card manager contribution
    Contribution.create!(user: user, card: card, contributor_name: user.email, content: Faker::Lorem.paragraph(sentence_count: 5))
    8.times do
      Contribution.create!(card: card, contributor_name: Faker::Name.unique.first_name, content: Faker::Lorem.paragraph(sentence_count: 5))
    end
  end
end

puts "#{Card.count} cards created"
puts "#{Contribution.count} contributions created"
