# Changelog for aHaskellPriori

## 2019.10.19.1
- Dataset en bronvermelding toegevoegd
- Kortere dataset aangemaakt, sneller voor debuggen
- Datasets kunnen worden uitgelezen met functie `bestandLezen`
- Alle unieke items van de transacties kunnen worden berekend door `recursiveUnion`.
Als input wordt gevraagd naar een lijst van sets. Iedere set representeerd een transactie.
- De unieke set kan worden omgezet naar een oplopend gesorteerde lijst met de functie `setToAscList`.
Hierdoor wordt het mogelijk om de producten te vinden die horen bij een bepaalde index in de
verschillende matrixen.
- Met `emptySupportMatrix` kan een lege matrix worden gemaakt met de lengte en breedte van het totaal
aantal unieke producten. Het totaal aantal unieke producten wordt berekend door de functie `setLen`.
- Packages `containers` en `matrix` toegevoegd aan `package.yaml`.
- Bronvermelding toegevoegd aan `README.md`.