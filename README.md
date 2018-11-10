# niedziela
Appka odpowiadająca na pytanie, czy dzisiaj sklepy są otwarte?

## Setup
```
bundle
bundle exec rackup
```

## TODO
- testy z Timecopem
- pobieranie danych o świętach z zewnętrznego API
- obliczanie niehandlowych niedziel (wolne to pierwsza i ostatnia w miesiącu)
- tablice z wolnymi dniami powinny być typu Date, żeby pozbyć się castowania do stringów w klasie CheckDate
