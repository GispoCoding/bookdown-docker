FROM r-base:4.2.1

RUN apt-get update \
    && apt-get install -y \
      pandoc \
    && apt-get clean

RUN R -e "install.packages( \
            c('bookdown', 'tidyverse'), \
            dependencies=TRUE, \
            repos='http://cran.rstudio.com/' \
         )"

WORKDIR /book

CMD ["Rscript", "-e", "bookdown::render_book('index.Rmd')"]
