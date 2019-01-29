# niedziela
Appka odpowiadająca na pytanie, czy dzisiaj sklepy są otwarte?

## Setup
```
bundle
bundle exec rackup
```
Uwaga: strefa czasowa jest ogarnięta przez zmienną środowiskową na Heroku (ustawione PL, żeby pokazywać zawsze wg czasu polskiego)

## Testy

`rake test`

## TODO
- fix na style następnej niedzieli
- ~~testy z Timecopem~~
- ~~pobieranie danych o świętach z zewnętrznego API~~
- ~~obliczanie niehandlowych niedziel (handlowe to pierwsza i ostatnia w miesiącu)~~
- ~~tablice z wolnymi dniami powinny być typu Date, żeby pozbyć się castowania do stringów w klasie CheckDate~~
- ~~style RWD~~
- ~~zrobić porządek z secretsami~~
