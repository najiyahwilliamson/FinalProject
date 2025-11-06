# Code Description

`code/01_make_output1.R`  
- read raw spell data from `Spells.csv`  
- categorize spells by type  
- filter and clean data  
- save cleaned data to `output/spells_filtered.rds`  
- create frequency table of spell categories  
- save table to `output/freq_cat.rds` and `output/freq_cat_table.html`

`code/02_make_output2.R`  
- read frequency table from `output/freq_cat.rds`  
- create bar plot of spell category counts  
- save figure to `output/spell_plot.png`

`code/03_make_output3.R`  
- read cleaned data from `output/spells_filtered.rds`  
- summarize spells by emitted light color  
- create HTML table with spell names and incantations  
- save table to `output/color_summary_table.html`

`code/04_make_output4.R`  
- read cleaned data from `output/spells_filtered.rds`  
- create stacked bar plot showing distribution of emitted colors by spell category  
- save figure to `output/spell_color_distribution.png`

`code/05_render_report.R`  
- render `FinalProjectSpells.Rmd`  
- save compiled report to `report.html`

`FinalProjectSpells.Rmd`  
- read data, tables, and figures from `output/` folder  
- display frequency table and both figures  
- compile final report for submission