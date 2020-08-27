# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts 'desrtoying user, cards and contributions'
# cards and contribution are destroyed along with their user
User.destroy_all

puts 'create 3 users : Micky, Marc and Samir'

User.create!(email: 'micky@lewagon.com', password: 'greeter1234')
User.create!(email: 'samir@lewagon.com', password: 'greeter1234')
User.create!(email: 'marc@lewagon.com', password: 'greeter1234')

puts "#{User.count} users created"

puts 'adding cards and contributions for each user'

User.all.each do |user|
  # adding 10 cards to each user
  10.times do
    titles = ["#{Faker::Name.unique.first_name}'s birthday", "Happy Wedding #{Faker::Name.unique.male_first_name} and #{Faker::Name.unique.female_first_name}", "Merry Christmas #{Faker::Name.unique.male_first_name} and #{Faker::Name.unique.female_first_name}"]
    picked_title = titles.sample
    date = titles.index(picked_title) == 2 ? Date.new(2020,12,25) : Date.today + rand(1..15)
    card = Card.create!(user: user, title: picked_title, event_date: date, description: "explaining here for who and for what event", recipient_email: user.email)
    # adding 5 contributions to each card, the 1st one is the card manager contribution
    Contribution.create!(user: user, card: card, contributor_name: user.email, content: Faker::Lorem.paragraph(sentence_count: 5))
    24.times do
      contribution = Contribution.new(card: card, contributor_name: Faker::Name.unique.first_name, content: Faker::Lorem.paragraph(sentence_count: 5) )
      url = "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1...100)}.jpg"
      puts URI.parse(url)
      contribution.photo.key = URI.parse(url)
      contribution.save
    end
  end
end

puts "#{Card.count} cards created"
puts "#{Contribution.count} contributions created"
