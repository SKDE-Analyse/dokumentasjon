#!/bin/sh


Rscript -e "rmarkdown::render_site(output_format = c('bookdown::gitbook'), encoding = 'UTF-8')"

#Rscript -e "rmarkdown::render_site(output_format = c('bookdown::gitbook', 'bookdown::pdf_book', 'bookdown::epub_book'), encoding = 'UTF-8')"
