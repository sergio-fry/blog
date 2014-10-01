---
layout: post
title:  "Rails Club 2014. Как все прошло"
date:   2014-09-29 23:16:44
categories: tech
tags: Rails Club, ruby
---

На этих выходных сходил с коллегами из SeoPult на ежегодную конференцию [Rails Club](http://railsclub.ru). Встретил много друзей, с которыми работали вместе в других компаниях. Еще я выиграл приз.

![Рубизатор](/images/posts/railsclub/prize.jpg)

Хочу рассказать о своих впечатлениях о докладах и что я из них вынес.


## Writing Fast Ruby. Эрик Майкл-Обер

![Eric](/images/posts/railsclub/eric.jpg)

Хорошо, что этот доклад начался с небольшим опозданием: я как раз успел. Эрик рассказал про то, что часто интуиция подводит нас в определении того, какой код на ruby будет быстрее.

  * иногда быстрее yield, иногда block
  * не используйте gsub, если достаточно sub или tr
  * не стоит сроить логику на exception-ах, если можно обойтись if/else/case, потому как это медленно
  * если код тормозит, выкинте из него ActiveSupport

И главная рекомендация, которую Эрик дал в самом начале: используйте [benchmark-ips](https://github.com/evanphx/benchmark-ips):

{% highlight ruby %}
require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("addition") { 1 + 2 }

   x.report("addition2") do |times|
     i = 0

     while i < times
       1 + 2
       i += 1
     end
   end
end
{% endhighlight %}

В отличие от обычного benchmark-а он сам определяет количество итераций, которые нужно прогнать, чтобы сравнить 2 куска кода.


## Работы с файлами в больших проектах. Кирилл Горин

![](/images/posts/railsclub/kirill.jpg)

Интересный рассказ про то, как это реально работает в Coub. Кирилл обрисовал проблемы, с которыми им пришлось столкнуться. Было интересно.


## The Elements of Style in Ruby. Божидар Бацов

![](/images/posts/railsclub/bojidar.jpg)

Во время доклада складывалось ощущение, что [Божидар](https://github.com/bbatsov) приехал из негритянского квартала в Болгарии. Зачем-то несколько раз он выразился английским матерком. Видимо, Болгария совсем небольшая страна и похвастаться знанием болгарского английского там было не перед кем.

Что касается самого материала, то была предпринята интересная попытка взглянуть на проблему оформления программного кода с новой стороны.

Кроме этого докладчик анонсировал свою библиотеку [Rubocop](https://github.com/bbatsov/rubocop) контроля за оформлением ruby-сода.

Хорошо подойдет для интеграции в CI системы.

## Интеграция всех аспектов разработки в единый процесс. Александр Балашов

![](/images/posts/railsclub/alex-inter.jpeg)

Если одним предложением: используйте CI-системы и pull-реквесты в вашем воркфлоу.

  * [brakeman](https://github.com/presidentbeef/brakeman) -- система поиска уязвимостей в Rails-приложении
  * [code climate](https://codeclimate.com) -- анализ качества кода, покрытие тестами
  * [teatro.io](https://teatro.io/) -- staging-сервер для каждого разработчика (использует docker)

Вообще, хорошая идея и у нас в компании настроить проект через [docker](https://www.docker.com/), чтобы каждый разработчик имел одинакувую среду.

## Круглый стол: бизнес логика в ROR приложении. Александр Даниленко

![](/images/posts/railsclub/table.jpg)

На доклад опоздал. Если в 2 словах, то: храните логику в правильном месте. Все зависит от ситуации. Кто бы сомневался :)

Посоветовали книги:

  * "Patterns in Enterprise Software" от Мартина Фаулера
  * Growing Rails Applications in Practice
  * Objects on Rails

## The Future of Rack. Аарон Паттерсон

![](/images/posts/railsclub/aaron2.jpg)

Жизнерадостный, содержательный, оставляющий очень живое впечателение доклад и сам докладчик. Ruby-код, картинки животных и самоироничные реплики.

Аарон рассказал про то, как много объектов участвует даже в простых операциях с участием Rails и как он работает над этим. Еще рассказал про то, какие проблемы есть с запуском тестов с участием ActiveRecord в несколько процессов и какие пути решения есть. Собственно, проблемы возникают, если у вас используются fixtures... Не используйте их! :) Используйте [FactoryGirl](https://github.com/thoughtbot/factory_girl)

![Аарон Паттерсон на Rails Club 2014](/images/posts/railsclub/aaron.jpg)

Еще он рассказал про свое видение Rack и то, как это сейчас. Считает, что нужно разделить rack-модули на 3 типа, а не как сейчас -- только один:

  * фильтр: добавляет before/after обработчик
  * "что-то там": обрабатывает, но не "что-то там", например сжатие GZIP
  * обычный rack, как сейчас
  
Свое видение отражается в новой библиотеке [the_metal](https://github.com/tenderlove/the_metal).


## Big Data и Ruby. Равиль Байрамкалин

Map и Reduce.

## Абстрактные машины во имя добра. Кирилл Тимофеев

![](/images/posts/railsclub/meme.jpg)

Можно показать котика и.. продолжить терять адутиторию. Кирилл это доказал. Показав целый зоопарк милый зверющек Кирилл не смог скрыть главного: сказать было нечего.

Было немного теории из лямбда-исчеслений. Никакой новизны, никакой практической нагрузки, никакого ruby! Последнее было смертельно. Все с нетерпением ждали, когда доклад закончится. Вопрос был только 1: "Ты рассказал о том, чем мы пожертвовали, начав писать на ruby?". 

## Concurent Systems in Ruby. Ждонас Никлас

![](/images/posts/railsclub/jonas.jpeg)

Наглядно про виды конкурентного исполнения ruby-кода, что такое thread-safe и GIL. Автор порекомендовал обратить внимание на библиотеки:

  * [Atomic](https://github.com/ruby-concurrency/atomic) -- thread-safe объекты
  * [Celluloid](http://celluloid.io/) -- Actor-based программирование
  * [Hamster](https://github.com/hamstergem/hamster) -- набор классов по concurrent ruby
  * [Concurent-ruby](https://github.com/ruby-concurrency/concurrent-ruby) -- еще один набор классов

Кроме этого порекомендовал книгу "[Working with Ruby Threads](https://pragprog.com/book/jsthreads/working-with-ruby-threads)".


## All The Little Things. Сенди Метц

![](/images/posts/railsclub/sendi.jpeg)

Сенди не смогла приехать живьем и выступала ерез скайп. Она не вставляла котиков и шутки ради шуток, при этом доклад держал в напряжении аудитории до самой развязки. Доклад был построен, как разбор одного случая из жизни программиста (самой Сенди), когда пришлось столкнутся с задачей исправления старого и запутанного метода.

Элегантный рефакторинг через тесты. Сразу захотелось что-то зарефаторить у себя в проекте.

Рекомендации:

  * книга [Practical Object-Oriented Design in Ruby](http://www.poodr.com/)
  * [SandiMeter](https://github.com/makaroni4/sandi_meter) -- статический анализатор ruby-кода в соответсвии с правилам Седи

## Sorcery и паттерны в Ruby. Кирилл Шатров

![](/images/posts/railsclub/auth.jpg)

Попытка рассказать, где хранить бизнес-логику в rails-приложении. Но мы уже знаем, что хранить ее нужно в правильном месте ("right place"). А еще, для того, чтобы перестать быть AcitveRecord-программистом, нужно вместо 1 AR-класса создать еще несколько.

Докладчик порекомендовал библиотеку для "аутентификенции" [sorcery](https://github.com/NoamB/sorcery) и отговаривал от [Devise](https://github.com/plataformatec/devise).

## Use Case Driven Architecture. Николай Рыжиков

Один из лучших докладов конференции. Простым языком, спокойно и содержательно. Надеюсь услышать докладчика с полноформатным выступлением в будущем.

## Chewy - удобный Elastic Search. Аркадий Забажанов

Самый пострадавший о технических сбоев доклад. Презентация никак не заводилась.

Пользуйтесь для поиска [Elasticsearch](http://www.elasticsearch.org/), потому что это быстро и хорошо. Для ruby используйте библиотеку [Chewy](https://github.com/toptal/chewy).

## Заключение

![](/images/posts/railsclub/all.jpeg)

Рекмендованные библиотеки, сервисы и инструменты:

  * [benchmark-ips](https://github.com/evanphx/benchmark-ips) -- измерение скорости
  * [Rubocop](https://github.com/bbatsov/rubocop) -- анализатор кода
  * [brakeman](https://github.com/presidentbeef/brakeman) -- система поиска уязвимостей в Rails-приложении
  * [code climate](https://codeclimate.com) -- анализ качества кода, покрытие тестами
  * [teatro.io](https://teatro.io/) -- staging-сервер для каждого разработчика (использует docker)
  * [docker](https://www.docker.com/) -- деплой через виртуалки
  * [FactoryGirl](https://github.com/thoughtbot/factory_girl) -- вместо fixtures для тестов
  * [the_metal](https://github.com/tenderlove/the_metal) --  веббиблиотека для построения веб-сервера, новое видение rack
  * [Atomic](https://github.com/ruby-concurrency/atomic) -- thread-safe объекты
  * [Celluloid](http://celluloid.io/) -- Actor-based программирование
  * [Hamster](https://github.com/hamstergem/hamster) -- набор классов по concurrent ruby
  * [Concurent-ruby](https://github.com/ruby-concurrency/concurrent-ruby) -- еще один набор классов
  * [SandiMeter](https://github.com/makaroni4/sandi_meter) -- статический анализатор ruby-кода в соответсвии с правилам Седи
  * [sorcery](https://github.com/NoamB/sorcery)  -- аутентификенция
  * [Elasticsearch](http://www.elasticsearch.org/) -- быстрый поиск
  * [Chewy](https://github.com/toptal/chewy) -- ruby-библиотека для Elasticsearch

Книги:

  * [Patterns in Enterprise Software](http://martinfowler.com/articles/enterprisePatterns.html)
  * [Growing Rails Applications in Practice](https://pragprog.com/book/d-kegrap/growing-rails-applications-in-practice)
  * [Objects on Rails](http://objectsonrails.com/)
  * [Working with Ruby Threads](https://pragprog.com/book/jsthreads/working-with-ruby-threads)
  * [Practical Object-Oriented Design in Ruby](http://www.poodr.com/)

