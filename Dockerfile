FROM blang/latex

RUN apt-get update && apt-get install -y \
    biber \
    vim

WORKDIR /root
COPY Makefile Makefile
COPY db.tex db.tex
COPY preamble.tex preamble.tex
COPY bibliography.bib bibliography.bib
ADD part ./part
ADD assets ./assets
RUN mkdir ./ans
CMD make build; mv db.pdf ./ans
