ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
RUN R --quiet -e "install.packages(c('dplyr', 'tidyr', 'gapminder', 'ggplot2',  'ggalt', 'forcats', 'R.utils', 'png', 'grid', 'ggpubr', 'scales', 'devtools'), repos = 'http://cran.us.r-project.org')"
RUN R --quiet -e "install.packages('pacman', repos = 'http://cran.us.r-project.org')"
RUN git clone https://github.com/bbc/bbplot.git .bbplot && \
    R --quiet -e "install.packages('.bbplot/bbplot', repos = NULL, type = 'source')" 
