library(tidyverse) # Package `stringr` most important for strings
library(rvest) # For web scraping

wiki_jump <- 'https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_area'
##wiki_jump <- 'https://en.wikipedia.org/wiki/Men%27s_long_jump_world_record_progression'

##Gets the tables from the url
long_jump <- read_html(wiki_jump)
tbl <- long_jump |>
  html_elements("table") |> # use html_elements() for all tables
  html_table()
tbl |> head()
## The table we need pertaining to total, land and water per country is the second table
tbl2 <- tbl[[2]]

## Fixing that two column does not have names
colnames(tbl2)[which(colnames(tbl2) == "")] <- paste0("New_Column_", seq_along(which(colnames(tbl2) == "")))

## Extracts the data in column Landin Km2 (mi2)
countries <- tbl2 |> pull("Landin km2 (mi2)" )
## Replaces "" with 0
countries = replace(countries, countries == "", "0")
## Extracts the number between ( and ), removes ",", converts as numbers abd reokaces NA with 0
LandinMi2 = str_extract(countries, "(?<=\\().+?(?=\\))") |> str_replace_all(",", "") |> as.numeric() |>  replace_na(0)

## Adds a column with the name Land_in_Mi2 and adds the LandinMi2 numbers. Sets scientific to false, so numbers will not appear ala 1.97e+07
tbl3 <- tbl2 |> 
  mutate(Land_in_Mi2 = format(LandinMi2, scientific = FALSE))

## repeats previous procedure but this time with "Totalin km2 (mi2)"
total <- tbl2 |> pull("Totalin km2 (mi2)" )
total = replace(total, total == "", "0")
totalInMi2 = str_extract(total, "(?<=\\().+?(?=\\))") |> str_replace_all(",", "") |> as.numeric() |>  replace_na(0)

tbl3 <- tbl3 |> 
  mutate(Total_in_Mi2 = format(totalInMi2, scientific = FALSE))

## repeats previous procedure but this time with "Waterin km2 (mi2)"
water <- tbl2 |> pull("Waterin km2 (mi2)" )
water = replace(total, total == "", "0")
waterInMi2 = str_extract(water, "(?<=\\().+?(?=\\))") |> str_replace_all(",", "") |> as.numeric() |>  replace_na(0)

tbl3 <- tbl3 |> 
  mutate(Water_in_Mi2 = format(waterInMi2, scientific = FALSE))



