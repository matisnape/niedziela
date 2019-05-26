# niedziela
Appka odpowiadająca na pytanie, czy dzisiaj sklepy są otwarte?

## Stack
Sinatra,
Nokogiri

## Setup
```
bundle
bundle exec rackup
```
Uwaga: strefa czasowa jest ogarnięta przez zmienną środowiskową na Heroku (ustawione PL, żeby pokazywać zawsze wg czasu polskiego).

## Testy

`rake test`

## TODO
- zapisywać scrapa do pliku z timestampem
- rake task na scrapowanie
- usuwanie starszego pliku po zapisaniu nowszego
- stworzenie background joba na heroku, który będzie scrapował o określonej godzinie
- zmiana logiki pobierania świąt - powinno to iść z pliku, a nie scrapować przy kazdym wejściu na strone
- dodać fallback file z listą stałych świąt

- ~~fix na style następnej niedzieli~~
- ~~rezygnacja z zewnętrznego API na rzecz scrapera~~
- ~~testy z Timecopem~~
- ~~pobieranie danych o świętach z zewnętrznego API~~
- ~~obliczanie niehandlowych niedziel (handlowe to pierwsza i ostatnia w miesiącu)~~
- ~~tablice z wolnymi dniami powinny być typu Date, żeby pozbyć się castowania do stringów w klasie CheckDate~~
- ~~style RWD~~
- ~~zrobić porządek z secretsami~~
