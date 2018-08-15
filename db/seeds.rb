# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# User.create!(email: 'rublen@mail.ru', password: 'author', first_name: 'man', last_name: 'author', type: 'Admin')
# author = User.create!(email: 'aprilsunday.lr@gmail.com', password: 'author', first_name: 'April', last_name: 'Sunday', type: 'Admin')
author = User.last

categories = Category.create! [{title: 'Ruby'}, {title: 'Ruby on Rails'}, {title: 'HTML'}, {title: 'JS'}]

tests = Test.create! [
  { title: 'Ruby Basics', level: 1, category_id: categories[0].id, user_id: author.id },
  { title: 'Ruby Metaprogramming', level: 3, category_id: categories[0].id, user_id: author.id },
  { title: 'ActiveRecord', level: 2, category_id: categories[1].id, user_id: author.id },
  { title: 'JS Basics', level: 1, category_id: categories[3].id, user_id: author.id }
]

questions = Question.create! [
  { body: 'What does self mean in Ruby?', test_id: tests[0].id },
  { body: 'Choose types of variables in Ruby', test_id: tests[0].id },
  { body: 'What does code "(8  + 10 / 4)  %  4" return?', test_id: tests[0].id },
  { body: 'What does code "Array.new.class" return?', test_id: tests[0].id },

  { body: 'What are scope gates in Ruby?', test_id: tests[1].id },
  { body: 'What is ORM?', test_id: tests[2].id },
  { body: 'How to get color of text in javascript?', test_id: tests[3].id }
]

Answer.create! [
  { body: 'Instance method', question_id: questions[0].id, correct: false },
  { body: 'Instance variable', question_id: questions[0].id, correct: false },
  { body: 'Default object', question_id: questions[0].id, correct: true },

  { body: 'Instance variable', question_id: questions[1].id, correct: true },
  { body: 'Class variable', question_id: questions[1].id, correct: true },
  { body: 'Global variable', question_id: questions[1].id, correct: true },
  { body: 'Local variable', question_id: questions[1].id, correct: true },

  { body: '2.5', question_id: questions[2].id, correct: false },
  { body: '2,5', question_id: questions[2].id, correct: false },
  { body: '2', question_id: questions[2].id, correct: true },

  { body: '[ ]', question_id: questions[3].id, correct: false },
  { body: 'Class', question_id: questions[3].id, correct: false },
  { body: 'Array', question_id: questions[3].id, correct: true },
  { body: 'nil', question_id: questions[3].id, correct: false },

  { body: 'Braces { }', question_id: questions[4].id, correct: false },
  { body: 'Key word "def"', question_id: questions[4].id, correct: true },
  { body: 'Key word "class"', question_id: questions[4].id, correct: true },
  { body: 'Key word "module"', question_id: questions[4].id, correct: true },

  { body: 'Object-relational mapping', question_id: questions[5].id, correct: true },
  { body: 'Object\'s record management', question_id: questions[5].id, correct: false },
  { body: 'Something else', question_id: questions[5].id, correct: false },

  { body: 'document.getElementById("myP").style.color', question_id: questions[6].id, correct: true },
  { body: '<p>.get_color', question_id: questions[6].id, correct: false },
  { body: 'document.getElementById("myP").color', question_id: questions[6].id, correct: false },
]
