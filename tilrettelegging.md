# Tilrettelegging av nye data fra NPR

## Lage diff-filer

- *gitbash* (og eventuelt *gvim*) må være installert

1. `vimdiff fil1 fil2 fil3 ...`
2. `:TOhtml`
3. Press Enter, hvis man får beskjed om det
4. `:save diff.html`
5. `:qa`


### Kodeverk

#### NCMP, NCRP, NCSP

- Koder hentet fra [Direktoratet for e-helse](https://ehelse.no/standarder-kodeverk-og-referansekatalog/helsefaglige-kodeverk/prosedyrekodeverkene-kodeverk-for-medisinske-kirurgiske-og-radiologiske-prosedyrer-ncmp-ncsp-og-ncrp)
- Filene ligger på ANALYSE/Data/Kodeverk/NCMP_NCSP_NCRP/
- txt-filer med tab-mellomrom mellom kode og tekst


#### ICD-10

- Koder hentet fra [Direktoratet for e-helse](https://ehelse.no/standarder-kodeverk-og-referansekatalog/helsefaglige-kodeverk/kodeverket-icd-10-og-icd-11)
- Filene ligger på ANALYSE/Data/Kodeverk/ICD10/
- txt-filer med tab-mellomrom mellom kode og tekst


#### DRG

- Koder hentet fra ...
- Filene ligger på ANALYSE/Data/Kodeverk/DRG/
- csv-filer produsert fra ISF xlsx-filer, med semikolon mellom kode og tekst
