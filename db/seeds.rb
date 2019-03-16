5.times do
  Author.create( { name: Faker::Name.name, age: Faker::Number.between(20, 67), moto: Faker::Lorem.sentence } )
  Article.create( { title: Faker::Book.title, body: Faker::Lorem.sentence, author_id: Faker::Number.between(1, 5) } )
end
