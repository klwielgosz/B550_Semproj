## INFO 550 Semester Project

This is the repo for INFO 550.  All data has been scrambled and some variables are randomly generated.

To run, you will need rmarkdown, as well as the following packages:
dplyr, tidyselect, tidyverse, ggplot2, stringr, furniture, knitr, readr

Program to install packages is included.

## Data/Variable Overview
CSV files needed to run are:

B550_Dat.csv contains all data for all participants.

Data_Dictionary.csv contains descriptions for all variables.

Medicare_segmentation_values.csv  contains definitions for values codes for the medicare segment.

## Makefile Overview
Makefile creates various parts for final report.  For detailed information, run the following within the project directory:

``` bash
make help
```

## Directions
Two methods to obtain report:

1) One command autorun program.  Within project directory, run:
``` bash
bash Autorun.sh
```

OR: 

2) Steps for running analysis manually:

2a) Within project directory, install required R packages by running:

``` bash
bash make install
```
	
2b) After packages are installed, you can create the charts and run the report by running:
	
``` bash
bash make
```

The output will be named "report_out.rmd" and will be located in the parent directory.

## Troubleshooting WSL vs Mac
If you are running WSL with r installed locally, this section does not apply. If you are running r on a mac or through homebrew on WSL, you will need to replace "Rscript.exe" with "Rscript" in the following files:
- Makefile
- R\Install_R_Pckg.sh