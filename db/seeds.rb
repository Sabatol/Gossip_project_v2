# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
PmUser.destroy_all
GoTag.destroy_all
Comment.destroy_all


require 'faker'

users = []
cities = []
gossips = []
tags = []
private_messages = []
pm_users = []
comments = []
likes = []


# 20.times do
#   city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
#   cities << city
# end

City.create(name: "Bry sur Marne", zip_code: "94 360")
City.create(name: "Champigny sur Marne", zip_code: "94 500")
City.create(name: "Charenton-le-Pont", zip_code: "94 220")
City.create(name: "Chennevières sur Marne", zip_code: "94 430")
City.create(name: "Ivry sur Seine", zip_code: "94 200")
City.create(name: "Joinville le Pont", zip_code: "94 340")
City.create(name: "Le Plessis-Trévise", zip_code: "94 420")
City.create(name: "Pontault-Combault", zip_code: "77 340")
City.create(name: "Saint-Maur-des-Fossés", zip_code: "94 100")
City.create(name: "Villejuif", zip_code: "94 800")
City.create(name: "Villiers sur Marne", zip_code: "94 350")
City.create(name: "Vitry sur Seine", zip_code: "94 400")
City.create(name: "Autre ville", zip_code: "XX XXX")



# 30.times do 
#   user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(7..150), city: cities.sample, password: "foobar")
#   users << user
# end

# 20.times do
#   gossip = Gossip.create(title: Faker::Superhero.suffix, content: Faker::JapaneseMedia::OnePiece.quote, user: users.sample)
#   gossips << gossip
# end

# 30.times do
#   tag = Tag.create(title: Faker::Games::Pokemon.name)
#   tags << tag
# end

# go_tags = []
# 150.times do
#   go_tag = GoTag.create(tag: tags.sample, gossip: gossips.sample)
#   go_tags << go_tag
# end

# 100.times do
#   private_message = PrivateMessage.create(content: Faker::Games::WorldOfWarcraft.quote, sender: users.sample)
#   private_messages << private_message
# end

# 300.times do
#   random = rand(1..10)
#   pm_user = PmUser.create(private_message: private_messages.sample, user: users.sample)
#   pm_users << pm_user
# end

# 100.times do
#   comment = Comment.create(content: Faker::Games::WorldOfWarcraft.quote, user: users.sample, gossip: gossips.sample)
#   comments << comment
# end

# 100.times do
#   like = Like.create(user: users.sample, gossip: gossips.sample)
#   likes << like
# end