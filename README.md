# Final Project Description

For this project, I will be working with the Spell subset of the Harry Potter Movies dataset, sourced from Kaggle. This subset contains 61 spells featured across the Harry Potter films, with detailed attributes including the spell name, incantation, effect, and the color of light produced during its use.

Given that all columns contain categorical data, my analysis will focus on descriptive and comparative techniques suitable for qualitative variables. Specifically, I plan to:

-   Explore frequency distributions of spell types (e.g., charms, curses, jinxes) based on the Spell.Name column, using bar plots and proportion tables to highlight dominant categories.
-   Investigate associations between spell type and light color using contingency tables and chi-square tests of independence to assess whether certain categories of spells tend to produce specific colors.

# Code and Output Description

The following code can be found under the code/ folder. Files with .rds, tables, and figures will be located in the output/ folder. There will be 5 Rscripts containing code and information as detailed below.

`code/01_make_output1.R`\
- read raw spell data from `Spells.csv`\
- categorize spells by type\
- filter and clean data\
- save cleaned data to `output/spells_filtered.rds`\
- create frequency table of spell categories\
- save table to `output/freq_cat.rds` and `output/freq_cat_table.html`

`code/02_make_output2.R`\
- read frequency table from `output/freq_cat.rds`\
- create bar plot of spell category counts\
- save figure to `output/spell_plot.png`

`code/03_make_output3.R`\
- read cleaned data from `output/spells_filtered.rds`\
- summarize spells by emitted light color\
- create HTML table with spell names and incantations\
- save table to `output/color_summary_table.html`

`code/04_make_output4.R`\
- read cleaned data from `output/spells_filtered.rds`\
- create stacked bar plot showing distribution of emitted colors by spell category\
- save figure to `output/spell_color_distribution.png`

`code/05_render_report.R`\
- render `FinalProjectSpells.Rmd`\
- save compiled report to `report.html`

# Final Document

The FinalProjectSpells.Rmd will be the report produced by the 5 Rscript files located in the code folder. To build this report, run the Makefile in this repository. To **synchronize** the project's package library with the versions recorded in renv.lock, run:

make install

This uses renv::restore() to install the required packages and ensure your environment matches the project configuration. **Note that this step only restores packages; to build the report or other outputs, run make.**

`FinalProjectSpells.Rmd`\
- read data, tables, and figures from `output/` folder\
- display frequency table and both figures\
- compile final report for submission
