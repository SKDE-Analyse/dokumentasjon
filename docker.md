# Docker

Diverse sider med info

- https://hackernoon.com/docker-and-best-practices-for-devops-c53ta30ki
- https://docker-curriculum.com/

## Docker image

**Lag docker image basert på Dockerfile**

Man kan lage et docker image av en lokal lagret docker fil med følgende kommando:

```bash
docker build /path/to/directory/containing/dockerfile/
```

Det vil si at man kan kjøre `docker build .` hvis man står i mappen allerede.

**Hent ned docker image**

```bash
docker pull openanalytics/shinyproxy-demo
```

Hvis man vil hente ned en spesifikk versjon (og ikke latest):

```bash
docker pull openanalytics/shinyproxy-demo:<versjon>
```

**Liste over docker images**

```bash
docker image ls
```

**Oppdatere docker image**

```bash
docker pull <REPOSITORY>
```

`<REPOSITORY>` sees i listen man får ved å kjøre `docker image ls`.
Denne kommandoen henter ned et helt nytt image og det eldre image vil fremdeles ligger der. Dette kan slettes, hvis den ikke brukes av en container.

**Slette docker image**

```
docker image rm <IMAGE ID>
```

`<IMAGE ID>` sees i listen man får ved å kjøre `docker image ls`.

## Docker container

**Lage en container**

```bash
docker container create <image>
```

Ofte vil man lage en container med diverse kommandoer. Vårt eget image `hnskde/shinymap` kan f.eks lages slik:

```bash
docker container create -v ~/.ssh:/home/rstudio/.ssh -e PASSWORD=password --name shinymap_dev -p 8787:8787 hnskde/shinymap:latest
```

**Starte en container**

```bash
docker start <NAMES>
```

`<NAMES>` sees i listen fra `docker ps -a` (se under).



**Se hvilke containere som kjører**

```bash
docker ps
```

Hvis man vil se alle containere så bruker man `docker ps -a`.



