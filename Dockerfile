ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
RUN R --quiet -e "install.packages(c('dplyr', 'tidyr', 'gapminder', 'ggplot2',  'ggalt', 'forcats', 'R.utils', 'png', 'grid', 'ggpubr', 'scales', 'devtools'), repos = 'http://cran.us.r-project.org')"
RUN R --quiet -e "install.packages('pacman', repos = 'http://cran.us.r-project.org')"
RUN R --quiet -e "remove.packages('devtools')"
RUN conda install -c conda-forge 'r-devtools' --quiet -y && \
    R --quiet -e "devtools::install_github('bbc/bbplot')"
