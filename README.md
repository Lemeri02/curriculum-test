# Тестовое задание

#### Ruby version

Версия `Ruby 2.7.0`

#### Установка и запуск приложения

1. Скопируйте репозиторий

```
$ git clone git@github.com:Lemeri02/curriculum-test.git
```

2. Запустите команду `bundle`
```
$ bundle
```
3. Запустите миграции
```
$ rails db:migrate
```

4. Добавляем демо данные в базу данных
```
$ rails db:seed
```

В БД будет добавлены: пользователи, группа с пользователями, курс, тест.

_см. `db/seeds.rb`_

5. Запустите консоль
```
$ rails c
```

#### Описание приложения

Для просмотра созданных данных при запущенном `rails c`:

Запишем пользователя c `id: 2` в переменную
```
u = User.find 2
```
---
Посмотрим какие курсы пользователю заданы:

```
u.courses
```
_Результат должен быть примерно таким:_
```
[#<Course id: 2, name: "Geo", created_at: "2020-07-15 15:27:49", updated_at: "2020-07-15 15:27:49">, #<Course id: 1, name: "Algebra", created_at: "2020-07-15 15:27:49", updated_at: "2020-07-15 15:27:49">]
```
---
Посмотрим какие курсы в прогрессе у пользователя

```
u.in_progress_courses
```

_Результат должен быть примерно таким, т.е. Алгебру пользователь всё еще не завершил, а географию - сдал_
```
[#<Course id: 1, name: "Algebra", created_at: "2020-07-15 15:27:49", updated_at: "2020-07-15 15:27:49">]
```
---
Можно посмотреть какие тесты заданы пользователю
```
u.quizzes
```
_Результат выдаст пустой массив, так как пользователю тесты не задавали_

---
Проверить пользователя на админа можно так
```
u.admin?
```
_Результат будет `false`_
