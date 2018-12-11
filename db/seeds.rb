# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

QUESTIONS_PER_TEST = 2
MIN_COMPLETED_TESTS = 2
RANDOM_SEED = 777 # Keeps generated random numbers persistent between db reseeding
category_titles = %w[Ruby SQL Rails]
user_names = %w[Bill Bob Alice]
categories = []
users = []
tests = []
questions = []
rnd = Random.new(RANDOM_SEED)


category_titles.each { |category| categories << Category.create!(title: category) }
user_names.each { |user| users << User.create!(name: user) }

categories.each do |category|
  tests << Test.create!(title: "#{category.title} Basics", level: 0, category_id: category.id)
  tests << Test.create!(title: "Advanced #{category.title}", level: 1, category_id: category.id)
end

tests.each do |test|
  (1..QUESTIONS_PER_TEST).each do |i|
    questions << Question.create!(body: "Question #{test.title} #{i}", test_id: test.id)
  end
end

questions.each do |question|
  Answer.create!(body: "Correct answer to #{question.body}", correct: true, question_id: question.id)
  Answer.create!(body: "Incorrect answer to #{question.body}", correct: false, question_id: question.id)
end

tests_count = tests.size
users.each do |user|
  rnd.rand(MIN_COMPLETED_TESTS..tests_count).times do
    Result.create!(user_id: user.id, test_id: tests[rnd.rand(tests_count)].id)
  end
end
