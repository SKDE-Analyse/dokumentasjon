## Github

### Sette opp Travis til å lage github pages


Om jeg husker rett må du gjøre følgende før dette vil fungere:

- Lage konto på Travis-CI.
- Lage en Token i github, som du legger inn i Travis-CI som GITHUB_TOKEN.
- Lag en branch som heter gh-pages.
- Gå inn i [settings](https://github.com/areedv/docSens/settings) og aktiver github-pages. Velg gh-pages som aktuell branch.

Travis-CI vil dytte html-filer, produsert av bookdown, til branchen gh-pages med `--force`. 
