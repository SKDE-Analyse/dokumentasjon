# Arnfinn

Mine egne notater, som er lite interessant for andre

## Splitte pdf

```bash
#!/usr/bin/env bash

num_pages=`qpdf --show-npages $1`

if [ "$num_pages" -ne "13" ]
then
echo "Number of pages ($num_pages) not equal 13"
echo "Something wrong with your pdf file"
exit 0
fi

qpdf --split-pages $1 tmp.pdf

mv tmp-01.pdf kvalitet_samlet_res.pdf
mv tmp-02.pdf kvalitet_hjerteinfarkt.pdf
mv tmp-03.pdf kvalitet_karkirurgi.pdf
mv tmp-04.pdf kvalitet_hjerneslag.pdf
mv tmp-05.pdf kvalitet_invasiv_kardio.pdf
mv tmp-06.pdf kvalitet_tarmkreft.pdf
mv tmp-07.pdf kvalitet_brystkreft.pdf
mv tmp-08.pdf kvalitet_lungekreft.pdf
mv tmp-09.pdf kvalitet_prostatakreft.pdf
mv tmp-10.pdf kvalitet_barnediabetes.pdf
mv tmp-11.pdf kvalitet_voksendiabetes.pdf
mv tmp-12.pdf kvalitet_hoftebrudd.pdf
mv tmp-13.pdf kvalitet_nyre.pdf
```

## Regular expressions

- Her kan man teste ut sine *regular expressions*: [regex101.com](https://regex101.com/)
- Søke etter `per` som ikke har bokstaver ved siden av seg. Vil ikke få treff på f.eks. `Per Sandberg` (stor `P`) eller `ropert` (bokstaver inntil).

```bash
[^a-zæøåA-ZÆØÅ]per[^a-zæøåA-ZÆØÅ]
```

- Søke med start (`^`) og slutt (`$`) på linje.

```bash
^Dette er en setning på egen linje$
```

- Definere argument 1, 2 etc. ved å bruke `\(` og `\)`, som så kan brukes etterpå. Her vil man kunne erstatte komma med punktum som desimaltegn (norsk til engelsk):

```bash
 sed -e 's/\([0-9]\),\([0-9][^0-9]\)/\1.\2/g'
```

- Sette inn tusenskilletegn (mellomrom)

```bash
sed -e 's/\([0-9]\)\([0-9][0-9][0-9][^0-9]\)/\1\\,\2/g' <file>
```

## Bash

`sed` vil konvertere fil fra windows til linux. Gjør derfor følgende:

```
for i in *.sas; do sed -e -i 's/foo/bar/g' $i; unix2dos $i; done
```

## Opprette automatisk dokumentasjonekstrasjon fra SAS-filer

I mange av våre prosjekter på [github](https://github.com/SKDE-Analyse) lages det dokuemtasjonssider automatisk når man oppdaterer koden. Dette gjøres av [Travis CI](https://travis-ci.org/SKDE-Analyse).

- Bruk følgende `.travis.yml` fil:

```yml
language: python

python:
  - "3.6"

before_script:
  # copy version 1.0.0 of the script from github
  - wget https://raw.githubusercontent.com/SKDE-Analyse/python-scripts/v1.0.0/skde/extract_sas_documentation.py

script:
    # Will only extract documentation from sas-files on root directory of project
  - python extract_sas_documentation.py

deploy:
  provider: pages                         # Specify the gh-pages deployment method
  skip_cleanup: true                      # Don't remove files
  github_token: $GITHUB_TOKEN             # Set in travis-ci.org dashboard
  local_dir: docs                         # Deploy the docs folder
  on:
    branch: master

notifications:
  email: false
```

- Aktiver Travis CI [her](https://travis-ci.org/profile/SKDE-Analyse)

- Trykk på *Settings* og legg inn `GITHUB_TOKEN`. Hent `GITHUB_TOKEN` fra `p/github/token.txt`.

- Legg inn følgende `_config.yml` fil i `docs`-mappe (lag denne mappen hvis den ikke eksisterer):

```
theme: jekyll-theme-minimal
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
3. Installér [r](https://cran.r-project.org/bin/windows/base/)
4. Installér [RStudio](https://www.rstudio.com/products/rstudio/download/)
5. Installér [MiKTeX](https://miktex.org/download) (basic MiKTeX installer)
6. Installér [vscode](https://code.visualstudio.com/download)
7. Installèr [gvim](http://mirror.netinch.com/pub/vim/pc/) (for å kunne få bedre vimdiff)
8. Installèr [python](https://www.python.org/downloads/) 3 (custom installasjon, slik at man kan skru av "for alle")

### RStudio

- bytte libpath

```r
> .libPaths("C:/Users/<user>/AppData/Local/Programs/R-3.3.1/library")
> .libPaths()
[1] "C:/Users/<user>/AppData/Local/Programs/R-3.3.1/library"
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

## Oversettelse, Helseatlas




### Diverse bash-kode

```bash
cat faktaark-eldre-til-oversettelse_-EN.tex |grep '\\section' | cut -d '{' -f 3 | sed 's/..............$//' > ../../list_factsheets_elderly.txt
```

#### Endre navn på fil (samme navn med forskjellig fil-endelse)

```bash
for i in <filename>.*; do mv $i <newfile>.${i##*.}; done
```



## Kompilere denne dokumentasjonen lokalt


### Linux

*R* må være installert, samt pakken *bookdown*. Gjør følgende i terminal (dette gjelder for Debian/Ubuntu:

```bash
sudo apt-get install r-base-core 
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libssl-dev
sudo Rscript -e 'install.packages("devtools","/usr/local/lib/R/site-library","http://cran.r-project.org")'
sudo apt-get install pandoc pandoc-citeproc
```

### Kompilere selve dokumentasjonen

```bash
sudo Rscript -e 'devtools::install_github("rstudio/bookdown")' # kun hvis pakken ikke er installert enda
Rscript -e "rmarkdown::render_site(output_format = c('bookdown::gitbook', 'bookdown::pdf_book', 'bookdown::epub_book'), encoding = 'UTF-8')"
```

Siste linje kan erstattes med å kun kjøre scriptet `_build.sh`.
