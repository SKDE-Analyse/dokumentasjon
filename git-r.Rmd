# Rstudio, git og github på Windows gjennom proxy

En beskrivelse av hvordan man setter opp git på Windows-maskiner finnes [her](intro-til-git-for-windows.html). Dette må gjøres først. Hvis det oppstår problemer med denne fremgangsmåten, send gjerne en beskjed til <A HREF="mailto:&#097;&#114;&#110;&#102;&#105;&#110;&#110;&#046;&#115;&#116;&#101;&#105;&#110;&#100;&#097;&#108;&#064;&#115;&#107;&#100;&#101;&#046;&#110;&#111;">arnfinn</A>.


## Hvordan sette opp git i rstudio

- Legg inn følgende i `/c/Users/$USERNAME/.ssh/config`:

```
Host githubhn
   Hostname github.com
   User git
   ProxyCommand /mingw64/bin/connect.exe -H www-proxy.helsenord.no:8080 %h %p
```
- Legg inn følgende i `/c/Users/$USERNAME/.gitconfig` (Rstudio leser denne i steden for den på p-disken):

```
[include]
    path = /p/.gitconfig
```

## Rstudio og github-pakker

- Skriv følgende i rstudio-konsollen
```r
library(httr)
set_config(use_proxy(url="http://www-proxy.helsenord.no", port=8080))
```
- For å installere pakker fra github
```r
library(devtools)
```

