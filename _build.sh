#!/usr/bin/env bash

export PATH=~/pandoc/1.19/usr/bin/:$PATH

Rscript -e "rmarkdown::render_site(output_format = c('bookdown::gitbook'), encoding = 'UTF-8')"

#Rscript -e "rmarkdown::render_site(output_format = c('bookdown::gitbook', 'bookdown::pdf_book', 'bookdown::epub_book'), encoding = 'UTF-8')"
