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

def attach_photo(contribution)
  url = "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1...100)}.jpg"
  uploaded_img = URI.open(url)
  contribution.photo.attach( io: uploaded_img, filename: "#{contribution.contributor_name}.jpg", content_type: 'image/jpg')
  contribution.save
end

User.all.each do |user|
  # adding 10 cards to each user
  10.times do
    titles = ["#{Faker::Name.unique.first_name}'s birthday", "Happy Wedding #{Faker::Name.unique.male_first_name} and #{Faker::Name.unique.female_first_name}", "Merry Christmas #{Faker::Name.unique.male_first_name} and #{Faker::Name.unique.female_first_name}"]
    picked_title = titles.sample
    date = titles.index(picked_title) == 2 ? Date.new(2020,12,25) : Date.today + rand(1..15)
    card = Card.create!(user: user, title: picked_title, event_date: date, description: "explaining here for who and for what event", recipient_email: user.email)
    # adding 5 contributions to each card, the 1st one is the card manager contribution
    contribution = Contribution.create!(user: user, card: card, contributor_name: user.email, content: Faker::Lorem.paragraph(sentence_count: 5))
    attach_photo(contribution)
    20.times do
      contribution = Contribution.new(card: card, contributor_name: Faker::Name.unique.first_name, content: Faker::Lorem.paragraph(sentence_count: 5) )
      attach_photo(contribution)
    end
  end
end

puts "#{Card.count} cards created"
puts "#{Contribution.count} contributions created"
