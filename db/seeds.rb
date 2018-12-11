# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w[Ruby SQL Rails]
users = %w[Bill Bob Alice]

categories.each { |category| Category.create(title: category) }
users.each { |user| User.create(name: user) }

t1 = Test.create(title: 'Ruby Basics', level: 0, category_id: Category.find_by_title('Ruby').id)
t2 = Test.create(title: 'Advanced Ruby', level: 1, category_id: Category.find_by_title('Ruby').id)
t3 = Test.create(title: 'SQL Basics', level: 0, category_id: Category.find_by_title('SQL').id)
t4 = Test.create(title: 'Advanced SQL', level: 1, category_id: Category.find_by_title('SQL').id)
t5 = Test.create(title: 'Rails Basics', level: 0, category_id: Category.find_by_title('Rails').id)
t6 = Test.create(title: 'Advanced Rails', level: 1, category_id: Category.find_by_title('Rails').id)

q1_1 = Question.create(body: 'Question Ruby Basics 1', test_id: t1.id)
q1_2 = Question.create(body: 'Question Ruby Basics 2', test_id: t1.id)

q2_1 = Question.create(body: 'Question Advanced Ruby 1', test_id: t2.id)
q2_2 = Question.create(body: 'Question Advanced Ruby 2', test_id: t2.id)

q3_1 = Question.create(body: 'Question SQL Basics 1', test_id: t3.id)
q3_2 = Question.create(body: 'Question SQL Basics 2', test_id: t3.id)

q4_1 = Question.create(body: 'Question Advanced SQL 1', test_id: t4.id)
q4_2 = Question.create(body: 'Question Advanced SQL 2', test_id: t4.id)

q5_1 = Question.create(body: 'Question Rails Basics 1', test_id: t5.id)
q5_2 = Question.create(body: 'Question Rails Basics 2', test_id: t5.id)

q6_1 = Question.create(body: 'Question Advanced Rails 1', test_id: t6.id)
q6_2 = Question.create(body: 'Question Advanced Rails 2', test_id: t6.id)

Answer.create(body: 'Correct answer to question Ruby Basics 1', correct: true, question_id: q1_1.id)
Answer.create(body: 'Incorrect answer to question Ruby Basics 1', correct: false, question_id: q1_1.id)
Answer.create(body: 'Correct answer to question Ruby Basics 2', correct: true, question_id: q1_2.id)
Answer.create(body: 'Incorrect answer to question Ruby Basics 2', correct: false, question_id: q1_2.id)

Answer.create(body: 'Correct answer to question Advanced Ruby 1', correct: true, question_id: q2_1.id)
Answer.create(body: 'Incorrect answer to question Advanced Ruby 1', correct: false, question_id: q2_1.id)
Answer.create(body: 'Correct answer to question Advanced Ruby 2', correct: true, question_id: q2_2.id)
Answer.create(body: 'Incorrect answer to question Advanced Ruby 2', correct: false, question_id: q2_2.id)

Answer.create(body: 'Correct answer to question SQL Basics 1', correct: true, question_id: q3_1.id)
Answer.create(body: 'Incorrect answer to question SQL Basics 1', correct: false, question_id: q3_1.id)
Answer.create(body: 'Correct answer to question SQL Basics 2', correct: true, question_id: q3_2.id)
Answer.create(body: 'Incorrect answer to question SQL Basics 2', correct: false, question_id: q3_2.id)

Answer.create(body: 'Correct answer to question Advanced SQL 1', correct: true, question_id: q4_1.id)
Answer.create(body: 'Incorrect answer to question Advanced SQL 1', correct: false, question_id: q4_1.id)
Answer.create(body: 'Correct answer to question Advanced SQL 2', correct: true, question_id: q4_2.id)
Answer.create(body: 'Incorrect answer to question Advanced SQL 2', correct: false, question_id: q4_2.id)

Answer.create(body: 'Correct answer to question Rails Basics 1', correct: true, question_id: q5_1.id)
Answer.create(body: 'Incorrect answer to question Rails Basics 1', correct: false, question_id: q5_1.id)
Answer.create(body: 'Correct answer to question Rails Basics 2', correct: true, question_id: q5_2.id)
Answer.create(body: 'Incorrect answer to question Rails Basics 2', correct: false, question_id: q5_2.id)

Answer.create(body: 'Correct answer to question Advanced Rails 1', correct: true, question_id: q6_1.id)
Answer.create(body: 'Incorrect answer to question Advanced Rails 1', correct: false, question_id: q6_1.id)
Answer.create(body: 'Correct answer to question Advanced Rails 2', correct: true, question_id: q6_2.id)
Answer.create(body: 'Incorrect answer to question Advanced Rails 2', correct: false, question_id: q6_2.id)

Result.create(user_id: User.find_by_name('Bill').id, test_id: t1.id)
Result.create(user_id: User.find_by_name('Bill').id, test_id: t3.id)
Result.create(user_id: User.find_by_name('Bill').id, test_id: t6.id)

Result.create(user_id: User.find_by_name('Bob').id, test_id: t1.id)
Result.create(user_id: User.find_by_name('Bob').id, test_id: t2.id)
Result.create(user_id: User.find_by_name('Bob').id, test_id: t3.id)
Result.create(user_id: User.find_by_name('Bob').id, test_id: t4.id)

Result.create(user_id: User.find_by_name('Alice').id, test_id: t5.id)
Result.create(user_id: User.find_by_name('Alice').id, test_id: t6.id)
