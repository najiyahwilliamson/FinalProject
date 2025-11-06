library(dplyr)
library(ggplot2)
library(here)
library(scales)

# Declare script location
here::i_am("code/04_make_output4.R")

# Load filtered spell data
data_complete <- readRDS(here::here("output", "spells_filtered.rds"))

# Ensure Spell.Category is a factor with desired order
data_complete$Spell.Category <- factor(data_complete$Spell.Category,
                                       levels = c("Charm", "Healing", "Curse", "Jinx",
                                                  "Transfiguration\nand Conjuring", "Other"))

# Define colors to match light names
color_mapping <- c(
  "Black smoke" = "#000000",
  "Blue" = "#1E90FF",
  "Bright yellow" = "#FFFF00",
  "Crystal clear" = "#E0FFFF",
  "Fiery Orange" = "#FF4500",
  "Orange" = "#FFA500",
  "Gold" = "#FFD700",
  "Green" = "#32CD32",
  "Haze" = "#87CEEB",
  "Icy blue" = "#00CED1",
  "Light green" = "#7CFC00",
  "Purple" = "orchid4",
  "Red" = "red3",
  "Scarlet" = "red",
  "Silver" = "#C0C0C0",
  "Turquoise" = "#40E0D0",
  "White" = "antiquewhite2"
)

# Create and save the stacked bar plot
color_plot <- ggplot(data_complete, aes(x = Spell.Category, fill = Light)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = percent_format()) +
  scale_fill_manual(values = color_mapping) +
  labs(title = "Distribution of Emitted Colors by Spell Type",
       x = NULL,
       y = "Percentage",
       fill = "Color Emitted") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
  )

# Save to output folder
ggsave(filename = here::here("output", "spell_color_distribution.png"),
       plot = color_plot,
       width = 10, height = 6, dpi = 300)