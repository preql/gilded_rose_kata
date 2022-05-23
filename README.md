# «Gilded Rose» 
___
(Источник: [Cсылка](https://github.com/emilybache/GildedRose-Refactoring-Kata))

(Описание: [Ссылка](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/main/GildedRoseRequirements_ru.txt))
___
## Краткое описание

Ката по рефакторингу «Gilded Rose» — известное упражнение, используемое для обучения некоторым принципам объектно-ориентированного проектирования. 
В дополнение к тому, что эта Ката действительно забавна, она прекрасно иллюстрирует 3 очень важных аспекта разработки программного 
обеспечения: потребность в надежном наборе тестов, когда рефакторить ваш код и как рефакторить ваш код.


> Реализация на языке Ruby

## Установка 

Скачайте или клонируйте приложение, здесь и далее, все команды вводятся в терминале(консоли), в корневой папке проекта.

Установите гем `bundler` если у вас его нет:

```
gem install bundler
```

Чтобы скачать необходимые библиотеки необходимо выполнить команду:
```
bundle install
```

Чтобы запустить тесты выполните команду:
```
rspec
```

Чтобы пронаблюдать работу алгоритма выполните команду:

```
ruby texttest_fixture.rb 
```

> Вы также можете установить количество отображаемых дней по вкусу отредактировав `texttest_fixture.rb`
> [здесь](https://github.com/preql/gilded_rose_kata/blob/main/texttest_fixture.rb#L19), сохранив 
файл и выполнить команду приведёную выше.

## Решение

Для того, чтобы разделить логику и сделать класс [`GildedRose`](https://github.com/preql/gilded_rose_kata/blob/main/lib/gilded_rose.rb#L3) 
расширяемым, и дабы не нарваться на пулю гоблина.
Было принято решение создать фабрику. 

Класс [`ItemFactory`](https://github.com/preql/gilded_rose_kata/blob/main/lib/item_factory.rb#L7) - 
Берет на себя создание товаров по типам, вытекающих из их названий:

Товар по умолчанию:
  * [`DefaultItem`](https://github.com/preql/gilded_rose_kata/blob/main/lib/default_item.rb#L3)

Особенные товары:
  * [`AgedBrieItem`](https://github.com/preql/gilded_rose_kata/blob/main/lib/aged_brie_item.rb#L3)
  * [`SulfurasItem`](https://github.com/preql/gilded_rose_kata/blob/main/lib/sulfuras_item.rb#L3)
  * [`BackstagePassesItem`](https://github.com/preql/gilded_rose_kata/blob/main/lib/backstage_passes_item.rb#L3)
  * [`ConjuredItem`](https://github.com/preql/gilded_rose_kata/blob/main/lib/conjured_item.rb#L3)

Каждый из товаров преобразованный через [`ItemFactory`](https://github.com/preql/gilded_rose_kata/blob/main/lib/item_factory.rb#L7), 
расширяет класс [`Item`](https://github.com/preql/gilded_rose_kata/blob/main/lib/item.rb#L1), и даёт возможность 
реализации бизнес-логики для конкретного товара с помощью метода `#update` уже в родном 
[`GildedRose`](https://github.com/preql/gilded_rose_kata/blob/main/lib/gilded_rose.rb#L3).

Все сущности разделены по разным файлам. Так как мы хотим иметь небольшие объекты с единственной ответственностью,
которые знают друг о друге как можно меньше. 

Итоговая цепочка такова [`GildedRose`](https://github.com/preql/gilded_rose_kata/blob/main/lib/gilded_rose.rb#L3) 
по прежнему инициализируется списком товаров, [`ItemFactory`](https://github.com/preql/gilded_rose_kata/blob/main/lib/item_factory.rb#L7)
преобразовывает каждый в соответствии с типом, и в методе 
[`GildedRose#update_quality`](https://github.com/preql/gilded_rose_kata/blob/main/lib/gilded_rose.rb#L10), все товары проходят преобразование 
уже в соответствии со своей бизнес-логикой.
