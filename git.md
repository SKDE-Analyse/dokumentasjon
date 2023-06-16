# git

## Legg inn brukernavn og epost

- Åpne *Git Bash*
    - Det er ikke mulig å bruke `ctrl-v` for å lime inn i Git Bash, men man kan trykke inn mellomtasten på musa (eller trykke høyretasten på musa og velge `Paste`)
    - `$` er ikke en del av det som skal skrives inn, men viser til at dette er tekst som skrives inn til Git Bash.
- Legg inn navn og epost:

```bash
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

## Lag SSH-nøkkel

- Hvis du skal bruke *git* sammen med *github* eller lignende må du lage en ssh-nøkkel. Trykk *Enter* når du får spørsmål om hvor nøkkel skal legges (så slipper du å lage ny nøkkel hver gang du må reinstallere maskinen, og nøkkelen din vil fungere på alle skde sine maskiner; bare trykk Enter når hun spør om passphrase):

```bash
$ mkdir /p/.ssh
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
Enter file in which to save the key (/p/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

## Legg din nøkkel på `github`

- Lag deg en profil på [github.com](https://github.com)
- Gå inn på [github.com/settings/ssh](https://github.com/settings/ssh) og legg inn din nye SSH-nøkkel (kopier over det som ligger i fila `/p/.ssh/id_rsa.pub`, eventuelt skriv `cat /p/.ssh/id_rsa.pub` i *git-bash* og kopier over det som spyttes ut).

## Sett opp ssh-komunikasjon gjennom proxy

- Dette gjøres for å kunne kommunisere med github, som må gjøres gjennom proxy her på Helse-Nord-nettet.
- Lag en fil kalt `config` i mappen `p/.ssh/` med innhold som under. Filen kan lages med `Notisblokk`, eller gjennom terminal (ved bruk av vim)

```
Host githubhn
   Hostname github.com
   User git
   ProxyCommand /mingw64/bin/connect.exe -H <helsenord-proxy>:<port> %h %p
```

- Hvis du har lyst til å prøve å lage denne filen gjennom terminal, gjør følgende:

```bash
$ vi /p/.ssh/config
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trykk så `p` for å lime inn, og så `:wq` pluss Enter for å lagre og lukke.

- Sjekk at git snakker med github ved å klone en repository (hvis ikke dette fungerer, er sannsyngligvis ikke git satt opp riktig):

```bash
$ cd
$ git clone githubhn:SKDE-Analyse/dokumentasjon.git tmp-mappe
$ rm -rf tmp-mappe # hvis alt gikk etter planen (fjerner mappen igjen)
```

## Github

### Kjøre Github Actions lokalt

Github Actions kan kjøres lokalt ved å bruke [act](https://github.com/nektos/act). Etter [installasjon](https://github.com/nektos/act#installation) kjøres alle testene med kommandoen `act`. En gitt jobb kan kjøres med kommandoen `act -j <jobname>`, hvor `<jobname>` er navnet gitt som nivå under `jobs:` i yaml-fil. I tilfelle under er `<jobname>` lik `deploy_doc`.

```yaml
jobs:
  deploy_doc:
    runs-on: ubuntu-20.04
    steps:
      - uses: actions/checkout@v2
      - ...
```

### Slette branch lokalt som er slettet remote

Følgende kommando kjøres etter `git fetch --prune` for å slette alle brancher med `[gone]`:

```bash
git branch -v|grep \\[gone\\]|awk '{print $1}'|xargs -I{} git branch -D {}
```

Hvis det dukker opp brancher her du egentlig ikke ville slette, kan du gjøre gjenopprette dem med kommandoen `git checkout -b <branch> <hash>`, der både `<branch>` og `<hash>` kan finnes i listen som spyttes ut av kommandoen over.

## Rstudio, git og github på Windows gjennom proxy

### Hvordan sette opp git i rstudio

- Hvis du skal bruke git sammen med RStudio må du lage en ny ssh-nøkkel og legge denne på `c:`, slik at Rstudio kan lese den (bytt ut `<user>` med ditt brukernavn; bare trykk Enter når hun spør om passphrase).

```bash
$ mkdir /c/Users/<user>/.ssh
$ ssh-keygen
Enter file in which to save the key (/p/.ssh/id_rsa): /c/Users/<user>/.ssh/id_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

- Legg inn følgende i `/c/Users/$USERNAME/.ssh/config`:

```
Host githubhn
   Hostname github.com
   User git
   ProxyCommand /mingw64/bin/connect.exe -H <helsenord-proxy>:<port> %h %p
```
- Legg inn følgende i `/c/Users/$USERNAME/.gitconfig` (Rstudio leser denne i steden for den på p-disken):

```
[include]
    path = /p/.gitconfig
```

- Hvis du skal laste ned pakker fra github i RStudio med devtools::install_github() må du først kjøre følgende:

```bash
Sys.setenv(http_proxy="<helsenord-proxy>:<port>")
Sys.setenv(https_proxy="<helsenord-proxy>:<port>")
```


## Diverse mer eller mindre obskure git-triks

### Ekskluder fil fra merge

I enkelte prosjekter vil det være filer man ikke vil oppdatere i en merge mellom brancher. I mitt tilfelle var det en csv-fil som er forskjellig i de ulike branchene, og skal være det. Denne oppskriften er tatt [herfra](https://medium.com/@porteneuve/how-to-make-git-preserve-specific-files-while-merging-18c92343826b#.sk2g4seov).

- Definér en merge-driver:

```bash
git config --global merge.ours.driver true
```

- Legge vår fil inn i .gitattributes:

```bash
echo 'unix.csv merge=ours' >> .gitattributes
git add .gitattributes
git commit -m 'Preserve unix.csv during merges'
```
