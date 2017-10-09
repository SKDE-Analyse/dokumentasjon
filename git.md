# Intro til git for windows

## Installèr git

Du kan fint installere *git* på nytt og på nytt uten risiko. Den fjerner gammel git før den installerer ny.

- Last ned fra [git-scm.com](https://git-scm.com/download/win) (obs: nedlasting starter automatisk) og installer med default (ikke endre noen valg)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git-bash.exe legges sannsynligvis her:
```bash
C:\Users\$USERNAME\AppData\Local\Programs\Git\
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connect.exe, git.exe etc. legges sannsynligvis her:
```bash
C:\Users\$USERNAME\AppData\Local\Programs\Git\mingw64\bin
```


## Legg inn brukernavn og epost

- Åpne `Git Bash`
    - Det er ikke mulig å bruke `ctrl-v` for å lime inn i Git Bash, men man kan trykke inn mellomtasten på musa (eller trykke høyretasten på musa og velge `Paste`)
    - `$` er ikke en del av det som skal skrives inn, men viser til at dette er tekst som skrives inn til Git Bash.
- Legg inn navn og epost:

```bash
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

## Lag SSH-nøkkel

- Hvis du skal bruke git sammen med RStudio må du legge nøkkel på `c:`, slik at Rstudio kan lese den (bytt ut `ast046` med ditt brukernavn; bare trykk Enter når hun spør om passphrase). 
```bash
$ mkdir /c/Users/ast046/.ssh
$ mkdir /p/.ssh # til senere
$ ssh-keygen
Enter file in which to save the key (/p/.ssh/id_rsa): /c/Users/ast046/.ssh/id_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

- Hvis du ikke har planer om å bruke git sammen med Rstudio så legger du nøkkelen på `p:`, ved å bare trykke Enter når du får spørsmål om hvor nøkkel skal legges (så slipper du å lage ny nøkkel hver gang du må reinstallere maskinen, og nøkkelen din vil fungere på alle skde sine maskiner; bare trykk Enter når hun spør om passphrase):
```bash
$ mkdir /p/.ssh
$ ssh-keygen
Enter file in which to save the key (/p/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

## Legg din nøkkel på `github`

- Lag deg en profil på [github.com](https://github.com)
- Gå inn på [github.com/settings/ssh](https://github.com/settings/ssh) og legg inn din nye SSH-nøkkel (kopier over det som ligger i `/c/Users/$USERNAME/.ssh/id_rsa.pub`, eller `/p/.ssh/id_rsa.pub`).

## Sett opp ssh-komunikasjon gjennom proxy

- Dette gjøres for å kunne kommunisere med github, som må gjøres gjennom proxy her på Helse-Nord-nettet.
- Lag en fil kalt `config` i mappen `p/.ssh/` med innhold som under Filen kan lages med `Notisblokk`, eller gjennom terminal (ved bruk av vim)
- Kutt ut første linje hvis du la din ssh-nøkkel på `p`.
- Bytt ut `ast046` med ditt brukernavn.

```
IdentityFile /c/Users/ast046/.ssh/id_rsa

Host githubhn
   Hostname github.com
   User git
   ProxyCommand /mingw64/bin/connect.exe -H www-proxy.helsenord.no:8080 %h %p
```

- Hvis du har lyst til å prøve å lage denne filen gjennom terminal, gjør følgende:
```bash
$ vi /p/.ssh/config
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trykk så `p` for å lime inn, og så `:wq` pluss Enter for å lagre og lukke.

- Sjekk at git snakker med github ved å klone en repository (hvis ikke dette fungerer, er sannsyngligvis ikke git satt opp riktig):

```bash
$ cd
$ git clone githubhn:SKDE-Analyse/test.git tmp-mappe
$ rm -rf tmp-mappe # hvis alt gikk etter planen (fjerner mappen igjen)
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



