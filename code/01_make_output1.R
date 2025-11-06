# Load required libraries FIRST
library(dplyr)
library(tidyr)
library(here)
library(readr)
library(kableExtra)


# Declare script location
here::i_am("code/01_make_output1.R")

# Read in your data
absolute_path_to_data <- here::here("Spells.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

# Categorize spells
data <- data %>%
  mutate(Spell.Category = case_when(
    grepl("charm|water-making spell|locking spell|general counter-spell|fire-making spell|dissendium|Human Presence Revealing Spell|lumos|protego maxima|protego totalum|Repello Inimicum", Spell.Name, ignore.case = TRUE) ~ "Charm",
    grepl("curse|sectumsempra", Spell.Name, ignore.case = TRUE) ~ "Curse",
    grepl("jinx|levicorpus|stunning spell", Spell.Name, ignore.case = TRUE) ~ "Jinx",
    grepl("episkey|brackium emendo", Spell.Name, ignore.case = TRUE) ~ "Healing",
    grepl("piertotum locomotor|snake summons spell|vera verto|incarcerous spell", Spell.Name, ignore.case = TRUE) ~ "Transfiguration\nand Conjuring",
    TRUE ~ "Other"
  ))

saveRDS(data, file = here("output", "spells_categorized.rds"))

# Filter and clean data
data_complete <- data %>%
  filter(!is.na(Spell.Category) & !is.na(Light) & Light != "") %>%
  droplevels()

saveRDS(data_complete, file = here("output", "spells_filtered.rds"))


# Frequency of categories
freq_cat <- data %>%
  count(Spell.Category, sort = TRUE)

# Ensure Spell.Category is character
freq_cat$Spell.Category <- as.character(freq_cat$Spell.Category)

# Define all categories in desired order
all_categories <- c("Charm", "Healing", "Curse", "Jinx", "Other", "Transfiguration\nand Conjuring")

# Complete missing categories and reorder
freq_cat <- freq_cat %>%
  complete(Spell.Category = all_categories, fill = list(n = 0)) %>%
  arrange(match(Spell.Category, all_categories))

# Save output
saveRDS(
  freq_cat,
  file = here("output", "freq_cat.rds")
)

# Create the formatted table
table_html <- kable(freq_cat, caption = "Frequency of Spell Categories", align = "c") %>%
  kable_styling(position = "center", full_width = FALSE)

# Save the HTML table to a file
writeLines(as.character(table_html), here("output", "freq_cat_table.html"))

