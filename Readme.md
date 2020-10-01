## INFO 550 Semester Project

This is the repo for INFO 550.  All data has been scrambled and some variables are randomly generated.

To run, you will need rmarkdown, as well as the following packages.
dplyr, tidyselect, tidyverse, ggplot2, stringr, furniture, knitr, readr

You can install the packages using the command below in `R`.

``` r
installed_pkgs <- row.names(installed.packages())
pkgs <- c("dplyr", "tidyselect", "tidyverse", "ggplot2", "stringr", "furniture", "knitr", "readr")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```

CSV files needed to run are:
B550_Dat.csv contains all data for all participants
Data_Dictionary.csv contains descriptions for all variables
Medicare_segmentation_values.csv  contains definitions for values codes for the medicare segment

Steps for running analysis
1) Install necessary r packages using commands above
2) After packages are installed, you can execute the analysis from the rpoject folder by running

``` bash
Rscript -e "rmarkdown::render('INFO550_Semproj_rcode.Rmd')"
```

The output should be called INFO550_Semproj_rcode.html.