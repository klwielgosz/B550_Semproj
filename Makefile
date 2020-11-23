## report_docker      : Make report from Docker image
report_docker:
	docker run -it --mount src=`pwd`,target=/project/,type=bind pz1

## report      : Generate final analysis report.
report: figs/fig1.png R/INFO550_Semproj_rcode.Rmd
	Rscript -e "rmarkdown::render('R/INFO550_Semproj_rcode.Rmd', output_file = '../output/report_out.html')"

## fig1.png    : Make age density by RUCC_Category.
figs/fig1.png: R/make_fig1.R
	chmod +x R/make_fig1.R && \
	Rscript R/make_fig1.R

## build	: build docker image
build: 
	@docker build -t pz1 .

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<