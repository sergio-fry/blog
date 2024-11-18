---
layout: page
---

# Автотесты

- CI - начинать проект нужно с того, что настраивается сборка
- краткость, читаемость, декларативность
- тесты - это тоже код и к нему применимы все критерии качества, что и к остальному коду
  - отличия кода и тестов? в них них поведения
- Даже, если тесты для кода не пишутся, проектировать код следует так, чтобы его можно было протестировать при необходимости. 
- не загружай лишний зависимости
  - do not use verifying double
  - загружать только необходимов
  - rails_helper, [spec_helper](https://github.com/sergio-fry/spec_helper/blob/master/spec_helper.rb)
- Arrange Act Assert
  - expect to receive
- скорость
- эффективность запуска
  - из редактора
  - запуск последних тестов
  - запуск только упавших
- предсказуемость
  - flakky
  - random seed
  - faker
  - date/time, timecop
  - чистое состояние, до и после
- предположения
  - expected_result
  - не требовать лишнего
  - порядок важен или нет?
- как найти тест, который нужно исправить
- что делать, если flakky не удается починить?
  - выделение в отдельную группу
  - rerun
  - allow failure?
- параллельное выполнение
  - выделение групп

- максимальный уровень изолированности, чистая архитектура
- пирамида тестирования
- тест должен общаться с кодом на том же уровне абстракции, использовать API кода
- нужно знать инструменты: чтобы писать тесты эффективно, хорошо, быстро (иначе не хочется - история)
- oneliners, less comments 
- контекст описан в самом тесте, поэтому не fixtures
- TDD? писать тесты в начале, а не в конце. Прагматичный подход
- ключи запуска: fail-fast, only-failures, next failing, ...
- subject as action 

## Ссылки

- [https://calebhearth.com/rspec-the-bad-parts](https://calebhearth.com/rspec-the-bad-parts)
- [flakky reasons](https://www.codewithjason.com/why-tests-flake-more-on-ci-than-locally/)