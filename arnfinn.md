﻿# Arnfinn

Mine egne notater, som er lite interessant for andre


## Diverse om figurer

### Fjerne hvit bakgrunn på eps/pdf-filer

- Åpne i Inkscape
- Velg objekt (klikk på bildet)
- Filtre - transparency utilities - Light eraser
- Lagre fil

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


