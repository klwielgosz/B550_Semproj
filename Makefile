## report_out.html : Generate final analysis report.
report_out.html: figs/fig1.png figs/fig2.png figs/fig3.png R/INFO550_Semproj_rcode.Rmd
	Rscript.exe -e "rmarkdown::render('R/INFO550_Semproj_rcode.Rmd', output_file = '../report_out.html')"
	
## install     : Install R packages needed to run this program.
install: R/Install_R_Pckg.sh
	chmod +x R/Install_R_Pckg.sh && \
	Rscript.exe R/Install_R_Pckg.sh
	
## fig1.png    : Make age density by RUCC_Category.
figs/fig1.png: R/make_fig1.R
	chmod +x R/make_fig1.R && \
	Rscript.exe R/make_fig1.R

## fig2.png    : Make age density by Loneliness Issues.
figs/fig2.png: R/make_fig2.R
	chmod +x R/make_fig2.R && \
	Rscript.exe R/make_fig2.R

## fig3.png    : Make age density by State.
figs/fig3.png: R/make_fig3.R
	chmod +x R/make_fig3.R && \
	Rscript.exe R/make_fig3.R


.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<