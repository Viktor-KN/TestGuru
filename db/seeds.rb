# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions_per_test = 2
min_completed_tests = 2
random_seed = 777 # Keeps generated random numbers persistent between db reseeding
categories = %w[Ruby SQL Rails]
users = %w[Bill Bob Alice]
rnd = Random.new(random_seed)

categories.map! { |category| Category.create!(title: category) }
users.map! { |user| User.create!(name: user, email: "#{user.downcase}@foo.bar", password: '123456', confirmed_at: Time.now.utc) }

tests = categories.flat_map do |category|
  Test.create!([{ title: "#{category.title} Basics", level: 0, category: category, author: users[1] },
                { title: "Advanced #{category.title}", level: 1, category: category, author: users[2] }])
end

questions = tests.flat_map do |test|
  Array.new(questions_per_test) do |i|
    Question.create!(body: "Question #{test.title} #{i + 1}", test: test)
  end
end

questions.each do |question|
  Answer.create!([{ body: "Correct answer to #{question.body}", correct: true, question: question },
                  { body: "Incorrect answer to #{question.body}", correct: false, question: question }])
end

# tests_count = tests.size
# users.each do |user|
#   rnd.rand(min_completed_tests..tests_count).times do
#     Result.create!(user: user, test: tests[rnd.rand(tests_count)])
#   end
# end
