# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all

user1, user2 = User.create([{ name: 'Luke' }, { name: 'Anakin' }])

ruby, js = Category.create([{ title: 'Ruby' }, { title: 'JavaScript' }])

test_ruby, test_js = Test.create(
  [
    { title: 'Основы Ruby', level: 0, category_id: ruby.id, user_id: user1.id },
    { title: 'Основы JavaScript', level: 1, category_id: js.id, user_id: user2.id }
  ]
)

q1, q2, q3, q4 = Question.create(
  [
    { body: 'Автор языка Ruby', test_id: test_ruby.id },
    { body: 'Год выпуска Ruby', test_id: test_ruby.id },
    { body: 'Автор языка JavaScript', test_id: test_js.id },
    { body: 'Год выпуска JavaScript', test_id: test_js.id }
  ]
)

Answer.create(
  [
    { body: 'Юкихиро Мацумото', question_id: q1.id, correct: true },
    { body: 'Гвидо ван Россум', question_id: q1.id, correct: false },
    { body: 'Деннис Ритчи', question_id: q1.id, correct: false },

    { body: '1997', question_id: q2.id, correct: false },
    { body: '1996', question_id: q2.id, correct: false },
    { body: '1995', question_id: q2.id, correct: true },

    { body: 'Брендан Эйх', question_id: q3.id, correct: true },
    { body: 'Джеймс Гослинг', question_id: q3.id, correct: false },
    { body: 'Расмус Лердорф', question_id: q3.id, correct: false },

    { body: '1999', question_id: q4.id, correct: false },
    { body: '1997', question_id: q4.id, correct: false },
    { body: '1995', question_id: q4.id, correct: true }
  ]
)
