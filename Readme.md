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

## Steps for Obtaining Report Output using Docker

1) Pull Docker Image
``` bash
docker pull pz032284/pz1
```

2) Clone github repo to local device, and set as project directory as current directory
``` bash
git clone https://github.com/pzhan56/B550_Semproj
cd B550_Semproj
```

3) Build Docker image using Makefile
``` bash
make build
```

4) Run report using Docker OR Makefile
``` bash
## Run with makefile
make report_docker
## Run with docker
docker run -it --mount src=`pwd`,target=/project/,type=bind pz032284/pz1
```

5) The output will be named "report_out.html" and will be located in the folder ./output.