---
layout: post
date: 2025-01-31
title: Создание не Active Record сущностей через FactoryBot
---
Почти все rails-разработчики знакомы с FactoryBot и с ее возможностями для создания тестовых данных. Однако, я у себя в проекте не использую AR, у меня репозитории и Entities, которые полностью in-memory объекты. Так называемые Plain Old Ruby Object (PORO). Что позволяет делать FactoryBot с такими классами?

На самом деле, много чего.

Объявление фабрики для своего кастомного класса:

```ruby
factory :file, class: "Domain::File" do
  author factory: %i[user]
  name { "file.txt" }
  id { Random.uuid }
end
```

После чего в тесте можно использовать ее так же, как и другие фабрики:

```ruby
let(:file) { build(:file) }
```

Кроме этого, можно настроить логику инициализации объекта, если конструктор класса принимает не один объект со всеми параметрами `attrs={}`, как это делает AR. Например, у нас принято использовать именованные аргументы:

```ruby
 initialize_with do
   new(
     author:,
     name:,
     id:
   )
 end
```

Но все это позволяет в тестах использовать только `build(:file)`. Понятно, что мы для того и отделяли бизнес-логику от логики хранения, чтобы тестировать их в отвязке от БД. Но иногда нужно создавать именно сохраненные объекты. 

FactoryBot предоставляет возможность объявить механизм, который позволит использовать `create(:file)` . Например, вот так можно сделать сохранение в репозиторий.

```ruby
to_create do |file, evaluator|
  DependenciesContainer.resolve(:files).save(file)
end
```

После этого начнет работать `create(:file)`, который вернет созданный объект:

```ruby
let(:file) { create(:file) }

it { expect(files.exists?(file.id)).not_to be_nil }
```

Кстати, такое создание не всегда означает создание записи в базе данных. Мы активно используем fake-репозитории в тестах, которые мы подключаем через dry-auto_inject. Таким образом, если в тесте подключены FakeFiles вместо реального репозитория, тогда такая фабрика будет работать тоже in-memory.

Ну и в завершении, весть пример в сборе

```ruby
FactoryBot.define do
factory :file, class: "Domain::File" do
  author factory: %i[user]
  name { "file.txt" }
  id { Random.uuid }

  initialize_with do
    new(
      author:,
      name:,
      id:
    )
  end
  
  to_create do |file, evaluator|
    DependenciesContainer.resolve(:files).save(file)
  end
end
```

FactoryBot - это не просто фабрика для ваших ActiveRecord моделей. Это мощный инструмент с огромными возможностями для создания любых объектов в ваших тестах.
