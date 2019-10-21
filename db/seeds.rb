# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Issue.destroy_all
Comment.destroy_all

3.times do
    Issue.create(
    title: Faker::Hipster.sentence(word_count: 3),
    description: Faker::Hacker.say_something_smart,
    creator: Faker::FunnyName.name 
  )
end

  10.times do
    Comment.create(
    issue_id: Faker::Number.between(from: 1, to: 3),
    description: Faker::Hacker.say_something_smart,
    commentor: Faker::FunnyName.name 
  )
end