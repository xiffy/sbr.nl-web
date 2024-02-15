# sbr.nl-web

In deze repository testen en bouwen we de sbr-nl taxonomy-website.
Diverse taxonomieen worden als aparte repo ontwikkeld, en elk van deze repo's draagt bij aan de website.
Bij een ping van een van de taxonomieen worden de tests gestart, en bi succes wordt de site gebouwd.
Die kan op bijv. github-pages gehost worden

Uitganspunten voor een correcte werking;
Er moet op elke taxonomy repository een secret worden gezet.
Naam: PAT
Inhoud, een fine-grained access token gegenereerd op de volgende manier:

Contributers aan een of meerdere taxo's kunnen op github een Personal Access Token (PAT) aanmaken die de workflow nodig heeft voor authenticatie.
Het token maak je als volgt aan (Web interface):
Klik op je foto of initialen rechtsboven,
kies settings 
kies <> Developer options (helemaal onderaan)
Kies Personal Access Token
Kies Fine-grained tokens
noem hem PAT
jaartje geldig maken is lui en handig
kies de juiste repo's (only selected repositories)
- alle taxo's
- de 'website en tester'
permissies:
- Actions: Read/Write
- Commit statuses: Read/Write
- Contents: Read/Write
- Pull requests: Read/Write

Generate en copy token.

Ga naar de taxonomy repository en kies settings rechtsboven. Kies in het linker menu "Secrets & Variables" vervolgens "Actions". Maak een Repository secret aan 
PAT, plak het token in de waarde en sla op. 
