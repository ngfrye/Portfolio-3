# load packages ----------------------------------------------------------------

library(robotstxt)
library(tidyverse)
library(rvest)

# set url ----------------------------------------------------------------------

first_url <- "https://npg.si.edu/portraits/collection-search?return_all=1&edan_local=1&edan_q=%252A%253A%252A&edan_fq%5B0%5D=p.edanmdm.indexedstructured.onphysicalexhibit%3AYes"

# read first page --------------------------------------------------------------

page <- read_html(first_url)

# scrape titles ----------------------------------------------------------------

titles <- page %>%
  html_nodes(".b-text-wrapper") %>%
  html_node(".title") %>%
  html_text() %>%
  str_squish()

# scrape artists ---------------------------------------------------------------

artists <- page %>%
  html_nodes(".b-text-wrapper") %>%
  html_node(".name") %>%
  html_text() %>%
  str_squish

# scrape medium ---------------------------------------------------------------

medium <- page %>%
  html_nodes(".b-text-wrapper") %>%
  html_node(".freetextobjecttype") %>%
  html_text() %>%
  str_squish

# scrape location ---------------------------------------------------------------

location <- page %>%
  html_nodes(".b-text-wrapper") %>%
  html_node(".freetextdatasource") %>%
  html_text() %>%
  str_squish

# scrape date ---------------------------------------------------------------

date <- page %>%
  html_nodes(".b-text-wrapper") %>%
  html_node(".freetextdate") %>%
  html_text() %>%
  str_squish

# put together in a data frame -------------------------------------------------

first_fifteen <- tibble(
  title = titles,
  artist = artists,
  medium = medium,
  location = location, 
  date = date
)