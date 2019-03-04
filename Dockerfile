ARG BASE_CONTAINER=tacosdedatos/tacos-en-jupyter:5cdfc5967bee
FROM $BASE_CONTAINER

LABEL maintainer="chekos <sergio@cimarron.io>"

## ejecuta algun archivo install.R que encontremos
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
