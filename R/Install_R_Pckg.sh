#! /usr/bin/env Rscript.exe

### This bash script installs packages needed to run analysis
installed_pkgs <- row.names(installed.packages())
pkgs <- c("dplyr", "tidyselect", "tidyverse", "ggplot2", "stringr", "furniture", "knitr", "readr")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
		install.packages(p, repos = "http://cran.us.r-project.org")
	}
}