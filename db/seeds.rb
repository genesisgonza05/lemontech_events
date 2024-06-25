require 'faker'

# Creating the main user
user = User.find_or_create_by(email: 'main@test.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
end

# Creating 50 events relates to the main user
50.times do
  Event.create!(
    name: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 5),
    event_date_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 365),
    location: Faker::Address.full_address,
    capacity: Faker::Number.between(from: 10, to: 500),
    requirements: Faker::Lorem.sentence(word_count: 5),
    user: user
  )
end

puts "Seed completed: 1 user with events created"
