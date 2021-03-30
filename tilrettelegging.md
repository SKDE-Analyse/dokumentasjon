# Tilrettelegging av data 

## Tilrettelegging av nye data fra NPR

**Dette kapitlet kan med fordel utvides.**

### Lese inn `csv`

Mulig dette også fungerer med `spss`-filer.

- Kjør først en `proc import` uten `GUESSINGROWS`.
- Hvis dette gir en `error`, ser man i loggen under `Notes` og finner den første/øverste linjen med noe ala dette: `NOTE: Invalid data for takst_15 in line 153 535-537`. 
- Sett så `GUESSINGROWS` til noe større enn `153` og kjør på nytt (se under).
- Dette gjøres helt til man ikke lenger får en feilmelding.

```sas
proc import datafile="\\tos-sas...\...\<filnavn>.csv" 
   out=utl_npr_somatikk
   dbms=csv
   replace;
   DELIMITER=';';
   GUESSINGROWS=200;
run;

```

### Lage diff-filer

- *gitbash* (og eventuelt *gvim*) må være installert

1. `vimdiff fil1 fil2 fil3 ...`
2. `:TOhtml`
3. Press Enter, hvis man får beskjed om det
4. `:save diff.html`
5. `:qa`


### Kodeverk

#### NCMP, NCRP, NCSP

- Koder hentet fra [Direktoratet for e-helse](https://ehelse.no/kodeverk/regler-og-veiledning-for-kliniske-kodeverk-i-spesialisthelsetjenesten-icd-10-ncsp-ncmp-og-ncrp)
- Filene ligger på ANALYSE/Data/Kodeverk/NCMP_NCSP_NCRP/
- txt-filer med tab-mellomrom mellom kode og tekst


#### ICD-10

- Koder hentet fra [Direktoratet for e-helse](https://ehelse.no/kodeverk/regler-og-veiledning-for-kliniske-kodeverk-i-spesialisthelsetjenesten-icd-10-ncsp-ncmp-og-ncrp)
- Filene ligger på ANALYSE/Data/Kodeverk/ICD10/
- txt-filer med tab-mellomrom mellom kode og tekst


#### DRG

- Koder hentet [her](https://helsedirektoratet.no/finansieringsordninger/innsatsstyrt-finansiering-isf-og-drg-systemet).
- Filene ligger på ANALYSE/Data/Kodeverk/DRG/
- csv-filer produsert fra ISF xlsx-filer, med semikolon mellom kode og tekst


#### Hente ut Hdiag3tegn formater

1. Lagre pdf, som hentes fra [Direktoratet for e-helse sine hjemmesider](https://ehelse.no/kodeverk/regler-og-veiledning-for-kliniske-kodeverk-i-spesialisthelsetjenesten-icd-10-ncsp-ncmp-og-ncrp), som tekstfil (`*.txt*`).
  - Åpne dokumentet
  - Merk all tekst (`CTRL + a`)
  - Kopier (`CTRL + c`)
  - Åpne et tomt tekstdokument i Notepad++ og lim inn (`CTRL + v`)
2. Kjør script `extract_hdiag3tegn.py`, som ligger på `Analyse/Data/python/script/skde/`, på tekstfilen
```
python /e/Analyse/Data/python/script/skde/extract_hdiag3tegn.py ICD-10_2017.txt > tmp.sas
```
3. Gå gjennom filen `tmp.sas` og fiks feil. Skriptet ser etter linjer som begynner på `Xnn `, der X er en bokstav og n er et tall. Linjer som dette: "C74 gis tilleggskode E27.5, og et basofilt adenom i hypofyse med Cushings syndrom med koden" bli også bli ekstrahert om må manuelt fjernes.

## Tilrettelegging av innbyggertall fra SSB

Innbyggertallene for 1. januar 2018 brukes som nevner når ratene for 2017 beregnes. Før utlevering av nye data fra NPR for året før, kan innbyggertallene fra 1. januar dette år hentes fra SSB. Innbyggertall fordelt på kommune hentes fra [tabell 07459](https://www.ssb.no/statbank/table/07459) mens innbyggertall for bydelene hentes fra [tabell 10826](https://www.ssb.no/statbank/table/10826).

1. Velg aktuelle kommuner/bydeler og siste år.
2. Last ned data som *Semikolonseparert med overskrift (csv)*.
3. Åpne csv-fil i Excel
  - Fjern i to øverste radene
  - Erstatt `kjønn` med `kjonn` og `Personer ÅÅÅÅ` med `Personer`
  - Sjekk at fanen heter `Personer`
  - Lagre som `xlxs`-fil med navnet `Innb20XX_bydel` eller `Innb20XX_kommune` i mappen `Analyse\Data\SAS\Tilrettelegging\Innbyggere`.
4. Kjør SAS-prosjektet `oppdatere_innbyggerfil.egp` i mappen `Analyse\Data\SAS\Tilrettelegging\Innbyggere`.

SAS-prosjektet vil lage et sas-datasett av Excel-filene og legge dem til fjorårets innbyggerfil.



