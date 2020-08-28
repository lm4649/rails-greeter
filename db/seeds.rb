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

def attach_photo(model, url, fname)
  uploaded_img = URI.open(url)
  model.photo.attach( io: uploaded_img, filename: fname, content_type: 'image/jpg')
  model.save
end

puts "Creating contribution sample (Contribution.first)"

card = Card.create!(user: User.last, title: 'Sample', event_date: Date.today, description: 'Sample card', recipient_email: User.last.email)
contribution = Contribution.new(user: User.last, card: card, contributor_name: '❤️ Greeter team', content: 'Thank you for all the support, patience and for pushing us to do our best!')
file = File.open('app/assets/images/greeter_team.jpg')
contribution.photo.attach(io: file, filename: 'greeter_team.jpg', content_type: 'image/jpg')
contribution.save

# 3 sample for each user
User.all.each do |user|
  # adding 10 cards to each user
  3.times do |i|
    titles = ["#{Faker::Name.unique.first_name}'s birthday", "Happy Wedding #{Faker::Name.unique.male_first_name} and #{Faker::Name.unique.female_first_name}", "Merry Christmas #{Faker::Name.unique.male_first_name} and #{Faker::Name.unique.female_first_name}"]
    picked_title = titles[i - 1]
    date = i - 1 == 2 ? Date.new(2020,12,25) : Date.today + rand(1..15)
    card = Card.new(user: user, title: picked_title, event_date: date, description: "explaining here for who and for what event", recipient_email: user.email)
    urls = ["https://images.unsplash.com/photo-1532498551838-b7a1cfac622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80", "https://images.unsplash.com/photo-1527594286615-07ea74362be7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80", "https://images.unsplash.com/photo-1545622783-b3e021430fee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"]
    attach_photo(card, urls[i-1], "#{card.title}.jpg")
    # adding 5 contributions to each card, the 1st one is the card manager contribution
    contribution = Contribution.new(user: user, card: card, contributor_name: user.email, content: Faker::Lorem.paragraph(sentence_count: 5))
    url = "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1...100)}.jpg"
    # url = "https://source.unsplash.com/250x400/?friends,party"
    attach_photo(contribution, url, "#{contribution.contributor_name}.jpg")
    5.times do
      contribution = Contribution.new(card: card, contributor_name: Faker::Name.unique.first_name, content: Faker::Lorem.paragraph(sentence_count: 5) )
      url = "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1...100)}.jpg"
      # url = "https://source.unsplash.com/250x400/?friends,party"
      attach_photo(contribution, url, "#{contribution.contributor_name}.jpg")
    end
  end
end

puts "#{Card.count} cards created"
puts "#{Contribution.count} contributions created"
