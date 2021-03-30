# R

Hvis det oppstår problemer med noen av disse fremgangsmåtene, send gjerne en beskjed til <A HREF="mailto:&#097;&#114;&#110;&#102;&#105;&#110;&#110;&#046;&#115;&#116;&#101;&#105;&#110;&#100;&#097;&#108;&#064;&#115;&#107;&#100;&#101;&#046;&#110;&#111;">arnfinn</A>.

## Sette globale instillinger

Når man starter en R-session leses filen `<R_USER>/.Rprofile`, hvis den finnes. Her kan man legge inn instillinger man vil ha hver gang man åpner en ny *session* (Mappen `<R_USER>` finnes ved å kjøre kommandoen `Sys.getenv("R_USER")`. Denne er som regel `p`-disken.). Eksempelvis kan RStudio finne LaTeX ved å legge følgende kommando i `.Rprofile`:

```
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "C:\\ProgramData\\App-V\\5667D610-8377-430E-9529-F9EA42A7D0E5\\78EEF753-8FA5-476F-9F66-E1D5ECB7A7FE\\Root\\VFS\\ProgramFilesX64\\MiKTeX\ 2.9\\miktex\\bin\\x64", sep=.Platform$path.sep))
```

(Stien til LaTeX kan finnes ved å kjøre følgende kommando i git-bash: `which pdflatex`)

## Rstudio og github-pakker

R-pakker som ligger på github kan installeres med

```r
devtools::install_github("<brukernavn>/<pakkenavn>")
```

For å kunne gjøre dette når man sitter bak proxy, må en av følgende koder kjøres først. Enten

```r
Sys.setenv(http_proxy="<helsenord-proxy>:<port>")
Sys.setenv(https_proxy="<helsenord-proxy>:<port>")
```

eller

```r
install.packages("httr")
library(httr)
set_config(use_proxy(url="<helsenord-proxy>", port=<port>))
```

## Rstudio og shinyapps

### Første gang

- Installér shiny-pakken
- Opprett en bruker på [shinyapps.io](http://www.shinyapps.io)
- Opprett en ny eller åpne en gammel "Shiny web application" i Rstudio.
- Kopier din token fra [shinyapps](http://www.shinyapps.io/admin/#/tokens) og kopier over i "Manage Accounts"

![Alt Text](figurer/rshiny_5.png)

### Laste opp en shinyapp til http://www.shinyapps.io

- Dette må gjøres gjennom proxy hvis man sitter på Helse Nord sitt nett. Følgende kommandoer må da kjøres først:

```r
options(RCurlOptions = list(proxy = "<helsenord-proxy>:<port>"))
options(shinyapps.http = "rcurl")
```

- Selve shinyappen lastes opp med følgende kommando

```r
rsconnect::deployApp(appName = "<navn>")
```

### Hvordan opprette en ny Rshiny applikasjon


![Alt Text](figurer/rshiny_1.png)

![Alt Text](figurer/rshiny_2.png)

![Alt Text](figurer/rshiny_3.png)

![Alt Text](figurer/rshiny_4.png)

![Alt Text](figurer/rshiny_5.png)

### Ta en backup av en eksisterende app

Gå inn på https://www.shinyapps.io/admin/#/dashboard og gå inn på applikasjonssiden. Her kan man laste ned en *Bundle* av appen på *Oveview*-siden.

Hvis man ønsker å dytte opp igjen denne versjonen til shinyapps.io etter at man har lastet den ned, må man først fjerne filen `manifest.json`.
