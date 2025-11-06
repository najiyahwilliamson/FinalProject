
library(dplyr)
library(kableExtra)
library(here)

# Declare script location
here::i_am("code/03_make_output3.R")

# Load the filtered and cleaned data
data_complete <- readRDS(here::here("output", "spells_filtered.rds"))

# Summarize by color
color_summary <- data_complete %>%
  group_by(Light) %>%
  summarise(
    Count = n(),
    Incantations = paste(Incantation, collapse = ", "),
    Spells = paste(Spell.Name, collapse = ", ")
  ) %>%
  arrange(desc(Count))

# Create HTML table
table_html <- kable(color_summary, caption = "Spell Colors with Names and Incantations", align = "c") %>%
  kable_styling(position = "center", full_width = FALSE)

# Save to output folder
writeLines(as.character(table_html), here("output", "color_summary_table.html"))
