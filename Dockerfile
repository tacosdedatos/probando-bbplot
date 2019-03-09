ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
RUN R --quiet -e "install.packages(c('dplyr', 'tidyr', 'gapminder', 'ggplot2',  'ggalt', 'forcats', 'R.utils', 'png', 'grid', 'ggpubr', 'scales', 'devtools', 'pacman', 'gganimate'), repos = 'http://cran.us.r-project.org')"
RUN git clone https://github.com/bbc/bbplot.git && \
    R --quiet -e "install.packages('bbplot', repos = NULL, type = 'source')" && \
    rm -rf bbplot
    
RUN apt-get install cargo -y
RUN git clone https://github.com/r-rust/gifski.git && \
    R --quiet -e "install.packages('gifski', repos = NULL, type = 'source')" && \
    rm -rf gifski
