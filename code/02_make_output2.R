# Load required libraries FIRST
library(dplyr)
library(tidyverse)
library(here)
library(readr)
library(kableExtra)

# Declare script location
here::i_am("code/02_make_output2.R")

# Read in your data
absolute_path_to_data <- here::here("output", "freq_cat.rds")
freq_cat <- readRDS(absolute_path_to_data)

# Create and save the bar plot
spell_plot <- ggplot(freq_cat,
                     aes(x = factor(Spell.Category,
                                    levels = c("Charm", "Healing", "Curse", "Jinx",
                                               "Transfiguration\nand Conjuring", "Other")),
                         y = n, fill = Spell.Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Spells by Category",
       x = NULL,
       y = "Count",
       fill = "Category") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# Save to output folder
ggsave(filename = here::here("output", "spell_plot.png"),
       plot = spell_plot,
       width = 8, height = 5, dpi = 300)

