# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create(name: 'student0')

Category.create(title: 'Ruby')
Category.create(title: 'Ruby on Rails')
Category.create(title: 'HTML')
Category.create(title: 'JS')

def create_test(title, level, category_title)
  Test.create({
    title: title,
    level: level,
    category_id: Category.find_by(title: category_title).id
  })
end

create_test('Ruby Basics', 0, 'Ruby')
create_test('Ruby Metaprogramming', 2, 'Ruby')
create_test('ActiveRecord', 1, 'Ruby on Rails')
create_test('JS Basics', 0, 'JS')

def create_question(body, test_title)
  Question.create({
    body: body,
    test_id: Test.find_by(title: test_title).id
  })
end

create_question('What does self mean in Ruby?', 'Ruby Metaprogramming')
create_question('What are scope gates in Ruby?', 'Ruby Metaprogramming')
create_question('What is ORM?', 'ActiveRecord')
create_question('How to get color for text in javascript?', 'JS Basics')

def create_answer(body, key_word, correct = false)
  question = Question.pluck(:body).find { |quest| quest.include? key_word }
  Answer.create({
    body: body,
    question_id: Question.find_by(body: question).id
  })
end

create_answer('Instance method', 'self')
create_answer('Instance variable', 'self')
create_answer('Default object', 'self', true)

create_answer('Braces { }', 'gates')
create_answer('Brackets [ ]', 'gates')
create_answer('Key word "def"', 'gates', true)
create_answer('Key word "class"', 'gates', true)
create_answer('Key word "module"', 'gates', true)

create_answer('Object-relational mapping', 'ORM', true)
create_answer('Object\'s record management', 'ORM')
create_answer('Something else', 'ORM')

create_answer('document.getElementById("myP").style.color', 'get color', true)
create_answer('<p>.get_color', 'get color')
create_answer('document.getElementById("myP").color', 'get color')

def create_test_pass(test_title, user_name)
  TestPassage.create({
    test_id: Test.find_by(title: test_title).id,
    user_id: User.find_by(name: user_name).id
  })
end

create_test_pass('Ruby Metaprogramming', 'student0')
create_test_pass('ActiveRecord', 'student0')
create_test_pass('JS Basics', 'student0')
