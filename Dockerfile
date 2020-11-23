FROM rocker/tidyverse

# install R packages like this
# put as close to top of script as possible to make best 
# use of caching and speed up builds
### This installs packages needed to run analysis
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('tidyselect')"
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('stringr')"
RUN Rscript -e "install.packages('furniture')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('readr')"

# Run from ubuntu
# FROM ubuntu

RUN apt-get update && apt-get install make

RUN mkdir /project
RUN mkdir /project/R
RUN mkdir /project/figs
RUN mkdir /project/raw_data
RUN mkdir /project/clean_data

# project directory
copy ./ /project	

# make R scripts executable
RUN chmod +x /project/R/*.R

# Make report,entrypoint
CMD make -C project report