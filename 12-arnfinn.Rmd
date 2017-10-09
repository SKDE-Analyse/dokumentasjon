# Arnfinn

Mine egne notater, som er lite interessant for andre

## Proxy

- curl gjennom proxy (f.eks for å få været i Tromsø:)):
```
curl.exe --proxy http://www-proxy.helsenord.no:8080/ wttr.in/Tromso
```
- Sette opp proxy generelt:
```
export http_proxy=http://www-proxy.helsenord.no:8080/
```

## Diverse om figurer

### Fjerne hvit bakgrunn på eps/pdf-filer

- Åpne i Inkscape
- Velg objekt (klikk på bildet)
- Filtre - transparency utilities - Light eraser
- Lagre fil

### Fjerne luft rundt figurer

Ble brukt på figurene til eldrehelseatlas-faktaarkene

`pdfcrop original.pdf croppet.pdf`

## Etter en retank av maskin

Installerer alt på `c/Users/ast046/AppData/Local/Programs/`

1. Installér Chrome og prøv å logg på
2. Installér [git](https://git-scm.com/download/win)
3. Installér [Nodepad++](https://notepad-plus-plus.org/download)
4. Installér [r](https://cran.r-project.org/bin/windows/base/)
5. Installér [RStudio](https://www.rstudio.com/products/rstudio/download/)
6. Installér [MiKTeX](https://miktex.org/download) (basic MiKTeX installer)
7. Installèr [Texmaker](http://www.xm1math.net/texmaker/download.html)
8. Installèr [gvim](http://mirror.netinch.com/pub/vim/pc/) (for å kunne få bedre vimdiff)
9. Installèr [python](https://www.python.org/downloads/) 3 (custom installasjon, slik at man kan skru av "for alle")

### Legge til skriver

- *TOS-UNN-C0.511A-03*

### RStudio

- bytte libpath
```r
> .libPaths()
[1] "\\\\hn.helsenord.no/unn-ansatte/a-ans/ast046/R/library"
[2] "C:/Users/ast046/AppData/Local/Programs/R-3.3.1/library"
> .libPaths("C:/Users/ast046/AppData/Local/Programs/R-3.3.1/library")
> .libPaths()
[1] "C:/Users/ast046/AppData/Local/Programs/R-3.3.1/library"
```

- Installere pakker
```r
install.packages("devtools")
install.packages("shiny")
install.packages("rsconnect")
install.packages("knitr")
install.packages("BH")
install.packages(c("DBI","DT","assertthat","caTools","dplyr", "htmlwidgets", "lazyeval","rmarkdown","tibble"))
install.packages("tidyr")
```

## Bytte standard nettleser

- Kan kun endres hvis man har administratorrettigheter på maskinen. Dette må Helse-Nord IKT gi brukeren.

## Oversettelse, Helseatlas

### Hvordan få et LaTeX-dokument klar for oversettelse

- Fjern unødvendige sider (forside, side 2, bakside etc.) manuelt
- Slå av fancyheadings (`\pagestyle{empty}`)
- Bruk `\usepackage[none]{hyphenat}` for å tvinge LaTeX til å ikke bryte ord. Ev. følgende kode
```
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
```
- Bruk `\usepackage[demo]{graphicx}` for å legge inn svarte bokser i steden for figurer. 
  Fungerer ikke alltid, så bruk eventuelt `\usepackage[allfiguresdraft]{draftfigure}` (*draftfigure.sty* må lastes ned)
- Konverter pdf-filen til word med adobe pro

### Hvordan konvertere word-dokumentet tilbake til LaTeX

- Lagre som rtf i word
- Konvertere med `rtf2latex2e -n -f -p 1 <filnavn.rtf>` med en linux/unix-maskin
- Hvis ikke dette går:
   - Lagre først som doc
   - Åpne doc og lagre som rtf


### regex i Overleaf

- Erstatt `/(\d)\s+(?=\d)/` med `$1,` for bytte ut tusentallsmellomrom med komma (norsk til engelsk).

### Diverse bash-kode

`
cat faktaark-eldre-til-oversettelse_-EN.tex |grep '\\section' | cut -d '{' -f 3 | sed 's/..............$//' > ../../list_factsheets_elderly.txt
`






