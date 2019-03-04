ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
RUN R --quiet -e "install.packages(c('dplyr', 'tidyr', 'gapminder', 'ggplot2',  'ggalt', 'forcats', 'R.utils', 'png', 'grid', 'ggpubr', 'scales', 'devtools'), repos = 'http://cran.us.r-project.org')"
USER root
RUN apt-get install libcurl4-gnutls-dev -y
USER $NB_UID
RUN R --quiet -e "install.packages('devtools', dep=T)" --save
RUN R --quiet -e "devtools::install_github('bbc/bbplot')"
