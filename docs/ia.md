# Instant Atlas

InstantAtlas (IA) er programvaren for det dynamiske kartverktøyet. 
Det er to programmer som benyttes: *InstantAtlas Publisher* og *InstantAtlas Designer*. 
For hjelp og mer info om *InstantAtlas Desktop*, se [Desktop User Guide](https://help.instantatlas.com/instantatlas-desktop/en/welcome/desktop-user-guide/).

## Lage et atlas fra bunnen av

- Åpne *Instant atlas publisher*
- Trykk på *Next*
- Velg `Single Map (HTML Edition) (v6.7.8)` (version er muligens ikke lik)
- Velg en *ESRI shapefile*. Sjekk så *Data Preview* og velg *Feature code field:* og *Feature name field:* i forhold til hva som ser rett ut.
- *Create a demo data file*
- Trykk på *Next*
- Trykk på *Next*
- Trykk på *Next*
- Pakk ut


Atlaset kan nå åpnes i *Firefox* ved å åpne filen `atlas.html`. Filene `data.js` og `config.xml` kan så erstattes, slik at man får ønsket data og oppsett. 

## Lage fila data.js fra excel workbook 

InstantAtlas leser inn data fra *JSON* (eller *XML*-filer), og disse filene lages i `IAWorkbooks` som er *Excel*-filer. 
For å kunne eksportere data fra *Excel* til et format som *Instant Atlas* can lese (en *json*-fil, `data.js`), 
må man installere et *Excel*-tillegg: [InstantAtlas Data Manger - The Excel Add-inn](https://help.instantatlas.com/instantatlas-desktop/en/welcome/desktop-user-guide/the-instantatlas-excel-data-manager/the-excel-add-in/). 
Det ligger her:

```
Analyse\Data\InstantAtlas\Excel_AddIns\IA Data Manager v6_7_4.xla
```

Da er det mulig i *Excel* å velge
- `Tillegg` - `IA Export`
- Velg *JSON* og lagre som `data.js`

## Oppdatere config.xml

Kan enten modifiseres direkte eller gjennom *InstantAtlas designer*

## Design av atlaset

- Åpne *Instant atlas designer*
- Åpne en `config.xml`-fil
- Juster på layout

## Logo

- Hvis man ikke definerer både høyde og bredde, men kun en av de, på logo i `config.xml` vil skaleringen alltid være riktig. Definer bredde på logo nederst til venstre; høyde på logo øverst til venstre.
- Unngå å bruke jpg i logoer
- Logo med kun tekst kan lages med følgende svg-kode

```html
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="900" height="66">
  <text x="10" y="50" font-family="Verdana" font-size="55"
        fill="#00509e" stroke="#00509e" stroke-width="2">
          Elderly (&#8805;75 years), 2013-2015
  </text>
</svg>
```

- `width` og `height` justeres slik at hele teksten kommer med (men ikke mer). Dette gjøres ved å åpne fil i nettleser samtidig som man endrer på verdiene.
- Det er mulig å bruke svg-filer på nettsidene, men har hatt noen problemer med dette i IA. Konverter figur til png, f.eks [her](http://svgtopng.com/)

## Legge ut et atlas på helseatlas.no

1. Gå inn på https://helseatlas.no/user og logg inn.
2. Trykk på *Legg til innhold* og velg *Atlas*.
3. Velg språk.
4. Gå til *Publiseringsvalg* og huk bort *Publisert*, siden vi ikke vil legge ut atlaset for publisering før alt er sjekket og klart.
5. Fyll ut punktene som har rød stjerne (*Navn* og *Tittel* i *Les mer*).
6. Last opp en zip-fil med IA-filene i *Filer til atlaset*-fanen.
7. Trykk på *Lagre*.

Senere kan man gå inn å legge til nye filer, erstatte filer, og publisere atlaset for alle. 
Så lenge man er logget inn kan man se atlaset på forsiden, slik det vil bli seende ut etter publisering.

## Legge inn lenke til faktaark

1. Last opp faktaark til nettsidene ved å gå på *Innhold* og *Filer*, og trykk på *Legg til fil*. **Ikke** gå på *Legg til innhold* og legg filene til der. Da vil filene sannsynligvis få tilfeldige navn.

2. Legg lenkeadressen (der disse filene legger seg) inn i tredje linje i `IA-workbook`. Den legges over tre celler.

3. Erstatt bolkene `ia-explorer-notes-icon` og `ia-explorer-notes-icon:hover` i filen `advanced.css` med følgende innhold:

```css
.ia-explorer-notes-icon 
{ 
	display:table-cell; /** Explorer notes icon: notes_hover.png --> pdfbw_notes.png*/
	background-image:url(pdfbw_notes.png);
	cursor:pointer;
	background-repeat:no-repeat;
	background-position:center left;
	width:20px; /** width:20px; */
	height:13px; /** height:13px; */		
}
.ia-explorer-notes-icon:hover
{
	background-image:url(pdf_notes_hover.png);  /** Explorer notes icon: notes_hover.png -->  pdf_notes_hover.png*/
}
```

4. Kopier over filene `pdfbw_notes.png` og `pdf_notes_hover.png` fra et annet atlas (f.eks herfra: `Analyse/Helseatlas/Eldre/IA/eldre_atlas/`).

5. *zip* mappen og last opp på nytt.
