# Linux

## Installere Linux på stasjonære jobb-pc

1. Få først Helse Nord IKT til å installere *VirtualBox*
2. Last ned [Lubuntu Alternate 64 bit](https://lubuntu.net/downloads/) eller [Linux Mint Mate](https://linuxmint.com/download.php). 

```{block2, linux-mint, type='rmdinfo'}
Det er [mange distroer](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg) å velge mellom, men det er disse to distroene jeg har fått til å fungere. Jeg har også prøvd følgende distroer uten hell: *Lubuntu Desktop* 64 bit og 32 bit (problemer med skjerm) og *Fedora LXDE 27.1* (fikk ikke til proxy).
```
3. Lag en ny *Virtal Machine* med *VirtualBox*, start opp med iso-filen og installer Linux.

### Lubuntu

#### Under installasjonen

- Installer Lubuntu Alternate 64 bit (se over)
- Skriv inn mellomtjener/proxy-adresse når man får spørsmål om det (se under)
- Velg statisk størrelse på harddisk, for å unngå kræsj hvis din windowsmaskin-harddisk fylles opp.

#### Etter installasjonen

- Koble til nett
  - Fikk problemer med dette i ett tilfelle med Lubuntu.
- Legg inn følgende i `.bashrc`:

```
export http_proxy=<helsenord-proxy>:<port>/
export https_proxy=<helsenord-proxy>:<port>/
```
- Kjør programvareoppdatering
- Installer `at-spi2-core` for å unngå advarsler senere
- Installer [Chrome](https://www.linuxbabe.com/ubuntu/install-google-chrome-ubuntu-16-04-lts) gjennom terminal
- Kjør Chrome gjennom terminal `google-chrome-stable` for å få det til å fungere med proxy (ev. `Alt + F2`)

 


## Linux gjennom proxy

### Linux Mint

- `Menu/Control Center/Internett and Network/Network Proxy/Proxy Configuration/Manual proxy configuration`

- Legg følgende i `.bashrc`:

```
export http_proxy=<helsenord-proxy>:<port>/
export https_proxy=<helsenord-proxy>:<port>/
```

```{block2, sudo-E, type='rmdimportant'}
Man må bruke `sudo -E` (*preserve existing environment*) i steden for kun `sudo` ved installering av pakker etc. Dette for å kunne kommunisere ut og inn gjennom proxy.
```

- For eksempel:

```
sudo -E apt install r-base-core
```


### Lubuntu

Under installasjonen får man spørsmål om proxy, hvis man installerer *Alternate*-versjonen. Da skriver man inn `<helsenord-proxy>:<port>/`. Hvis man ikke blir spurt om dette, kan man legge følgende inn i `/etc/apt/apt.conf`:

```
ACQUIRE::http::Proxy "<helsenord-proxy>:<port>/";
```

Proxy for *Firefox* legges inn i instillinger. Proxy for *Chrome* var ikke like enkelt... (enklere i Ubuntu). 

### Generelt

- For å kommunisere med github legges følgende i filen `.ssh/config`:

```
Host githubhn
        HostName github.com
        User git
        ProxyCommand /bin/nc -X connect -x www-proxy.helsenord.no:<port> %h %p
```

## R/RStudio

```{block2, rstudio, type='rmdinfo'}
Bak proxy må RStudio kjøres fra terminal.
```

### Sett opp CRAN

Åpne filen `/etc/apt/sources.list` med `sudo` og legg inn følgende:

```
deb https://cloud.r-project.org/bin/linux/ubuntu xenial/ 
```
Bytt ut `xenial` hvis du bruker en annen versjon av Ubuntu.

Kjør følgende kommandoer:

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update
```


### Installere R

```
sudo apt-get install r-base
sudo apt-get install r-base-dev # sannsynligvis greit også å installere denne
```

### Installere RStudio

- Last ned RStudio, og installer i terminal:

```
sudo apt-get install libjpeg62 # RStudio er avhengig av denne pakken
sudo dpkg -i Downloads/rstudio-*
```

```{block2, ubuntu, type='rmdinfo'}
Linux Mint er basert på LTS-versjon av Ubuntu. Per des. 2017 er dette Ubuntu 16.04.
```

### Installere `devtools`

`devtools` er avhengig av `git2r` og `httr`. Disse må ha følgende installert for å fungere

```
sudo apt-get install libssl-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libssh2-1-dev
```

## Eksternt skrivebord

Jeg (Arnfinn) fikk dette til å fungere på Lubuntu, som tilsvarer vanlig Ubuntu. Jeg installerte først *Remmina*, men sannsynligvis ikke nødvendig (skriver det her sånn i tilfelle det er nødvendig for at *Citrix Receiver* skal fungere). 

1. Installer [Citrix Receiver for Linux](https://www.citrix.no/downloads/citrix-receiver/linux/receiver-for-linux-latest.html). Hvis du bruker Ubuntu, velg *Debian Package* og *Full Package (Self-Service Support)*  
2. Gå inn på [portal.helsenord.no/vpn](https://portal.helsenord.no/vpn/index.html) og logg inn som vanlig.
3. Dobbeltklikk på *ica*-filen, som lastes ned. Denne vil så åpnes i *Citrix Receiver*

