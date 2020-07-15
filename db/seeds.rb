# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Создаем пользователей
user_1 = User.create(username: 'Ivan', role: 'admin')
user_2 = User.create(username: 'Jhon')
user_3 = User.create(username: 'Fiona')
user_4 = User.create(username: 'Harold')

# Создаем пустую группу
group_1 = Group.create(name: 'Newbies')

# В созданную группу добавляем пользователей
group_1.users << user_2 << user_3

# Создаем курс и тест
course = Course.create(name: 'Algebra')
course2 = Course.create(name: 'Geo')
quiz = Quiz.create(name: 'History')

# Создаем учебное задание
EducationalAssignment.create(assignee: user_4, educational: quiz)
EducationalAssignment.create(assignee: group_1, educational: course)
EducationalAssignment.create(assignee: user_2, educational: course2)


# Пользователь user_4 завершает тест
Completion.create(user: user_4, educational: quiz)
Completion.create(user: user_2, educational: course2)
