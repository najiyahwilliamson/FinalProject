report.html: FinalProjectSpells.Rmd code/05_render_report.R make_output1 make_output3 make_output4
	Rscript code/05_render_report.R

make_output1:
	Rscript code/01_make_output1.R
	
make_output2: make_output1
	Rscript code/02_make_output2.R

make_output3: make_output1
	Rscript code/03_make_output3.R

make_output4: make_output1
	Rscript code/04_make_output4.R

docker_report:
	docker run --rm \
		-v "$(PWD)/report:/project/report" \
		-v "$(PWD)/output:/project/output" \
		finalprojectspells

.PHONY: clean
clean:
	rm -f output/*.rds output/*.html output/*.png && rm -f report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
