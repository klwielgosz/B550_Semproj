# rule for making report  
report.html: data.txt report.Rmd fig1.png
	Rscript -e "rmarkdown::render('report.Rmd', quiet = TRUE)"

# rule for cleaning data
data.txt: cleandata.R raw_data.txt
	chmod +x cleandata.R && \
	Rscript cleandata.R

# rule for making the figure
fig1.png: make_fig1.R data.txt
	chmod +x make_fig1.R && \
	Rscript make_fig1.R

# Document echo help text
.PHONY: help
help:
    @echo "report.html : Generate final analysis report."
    @echo "fig1.png    : Make a histogram of X."
    @echo "install       : Install R packages needed to run this program."