ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
RUN R --quiet -e "install.packages(c('dplyr', 'tidyr', 'gapminder', 'ggplot2',  'ggalt', 'forcats', 'R.utils', 'png', 'grid', 'ggpubr', 'scales', 'devtools', 'pacman', 'gganimate'), repos = 'http://cran.us.r-project.org')"
RUN git clone https://github.com/bbc/bbplot.git && \
    R --quiet -e "install.packages('bbplot', repos = NULL, type = 'source')" && \
    rm -rf bbplot

USER root
RUN apt-get update -y
RUN apt-get install cargo -y
USER $NB_UID
RUN git clone https://github.com/r-rust/gifski.git && \
    R --quiet -e "install.packages('gifski', repos = NULL, type = 'source')" && \
    rm -rf gifski

RUN R --quiet -e "install.packages('grImport2', repos = 'http://cran.us.r-project.org')"
RUN git clone https://github.com/rensa/ggflags.git && \
    R --quiet -e "install.packages('ggflags', repos = NULL, type = 'source')" && \
    rm -rf ggflags
