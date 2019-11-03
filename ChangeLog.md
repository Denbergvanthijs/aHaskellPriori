# Changelog for aHaskellPriori

## 2019.11.03.2

- Confidence met een onbekend productA wordt nu `0.0` i.p.v. `NaN`
- Formatting van enkele bestanden
- Keuze `5` toegevoegd om het populairste product van de dataset te tonen
- Deprecated code van `Matrix.hs` iets netter gemaakt. Deze code dient geen nut maar blijft bewaard om de geïnvesteerde tijd aan te tonen.
- Spelfouten uit `ChangeLog.md` en `README.md` aangepast.

## 2019.11.03.1

- Mogelijk gemaakt om eigen bestanden te kunnen gebruiken voor aanbevelingen

## 2019.10.28.1

- `Datatypes.hs` werkend gekregen, `DatatypesOld.hs` is verwijderd
- Veel functies herschreven zodat deze met `Product`, `Transactie` en `Transacties` datatypes om kunnen gaan
- TODO-list uitgebreid in `README.md`
- Markdown in `ChangeLog.md` en `README.md` verbeterd

## 2019.10.26.3

- Documentatie gemaakt voor alle bestanden in `src/`
- Guards toegevoegd aan `Lib` zodat foute waardes worden afgevangen
- Imports in `Tools` en andere bestanden verbeterd en efficiënter gemaakt

## 2019.10.26.2

- Eerste test met VScode en Hlint

## 2019.10.26.1

- Main.hs aangepast, begin gemaakt aan het menu
- Variabelen voor debuggen in `DatatypesOld.hs` gezet
- `Datatypes.hs` bevatten de nieuwe datatypes `Product`, `Transactie`, `Transacties`. Helaas nog niet werkend

## 2019.10.24.1

- Documentatie wordt in de goede map aangemaakt door `stack haddock --haddock-arguments "-o docs"`

## 2019.10.23.2

- Code geformat met Stylish Haskell

## 2019.10.23.1

- calcSupport leesbaarder gemaakt
- Het beste product `Y` bij een product `X` kan nu automatisch worden opgevraagd. Gebruikmakende van `calcLift`
- Functie toegevoegd om de tuple met hoogste fst te returnen uit een lijst met tuples
- Typedeclaraties verbeterd van o.a. setToAscList en setToListOfSets
- Debugdata in `main.hs` realistischer gemaakt
- File `Tools.hs` aangemaakt om de daadwerkelijke berekeningen van de minder belangrijke functies te scheiden
- Imports verbeterd: Set.Set a is nu Set a bijvoorbeeld

## 2019.10.22.1

- Extra bronvermelding toegevoegd
- Het berekenen van de support, confidence en lift van een set producten is nu mogelijk
- Extra bestand in `src/` aangemaakt om berekeningen voor support, confidence, lift te spliten van de matrixen
- Variabelen aangemaakt in `main.hs` om het debuggen te vergemakkelijken

## 2019.10.20.1

- Uitleg van Apriori algoritme en de eigen implementatie van het algoritme
- Bronvermelding uitgebreid

## 2019.10.19.1

- Dataset en bronvermelding toegevoegd
- Kortere dataset aangemaakt, sneller voor debuggen
- Datasets kunnen worden uitgelezen met functie `bestandLezen`
- Alle unieke items van de transacties kunnen worden berekend door `recursiveUnion`.
Als input wordt gevraagd naar een lijst van sets. Iedere set representeert een transactie.
- De unieke set kan worden omgezet naar een oplopend gesorteerde lijst met de functie `setToAscList`.
Hierdoor wordt het mogelijk om de producten te vinden die horen bij een bepaalde index in de
verschillende matrixen.
- Met `emptySupportMatrix` kan een lege matrix worden gemaakt met de lengte en breedte van het totaal
aantal unieke producten. Het totaal aantal unieke producten wordt berekend door de functie `setLen`.
- Packages `containers` en `matrix` toegevoegd aan `package.yaml`.
- Bronvermelding toegevoegd aan `README.md`
