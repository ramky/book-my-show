# Create 5 shows for each show type
%w[movies events plays sports].each do |show|
  5.times do
    Show.create(
      name: Faker::Lorem.sentence(word_count: 3),
      desc: Faker::Lorem.paragraph(sentence_count: 2),
      location: Faker::Nation.capital_city,
      show_type: show,
      show_dt_time: Faker::Date.forward(days: rand(30))
    )
  end
end
puts "20 shows from seed created."