# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# function: scrape_page --------------------------------------------------------

scrape_page <- function(url){
  
  # read page
  page <- read_html(url)
  
  # scrape titles
  
  titles <- page %>%
    html_nodes(".b-text-wrapper") %>%
    html_node(".title") %>%
    html_text() %>%
    str_squish()
  
  # scrape artists 
  
  artists <- page %>%
    html_nodes(".b-text-wrapper") %>%
    html_node(".name") %>%
    html_text() %>%
    str_squish
  
  # scrape medium
  
  medium <- page %>%
    html_nodes(".b-text-wrapper") %>%
    html_node(".freetextobjecttype") %>%
    html_text() %>%
    str_squish
  
  # scrape location
  
  location <- page %>%
    html_nodes(".b-text-wrapper") %>%
    html_node(".freetextdatasource") %>%
    html_text() %>%
    str_squish
  
  # scrape date
  
  date <- page %>%
    html_nodes(".b-text-wrapper") %>%
    html_node(".freetextdate") %>%
    html_text() %>%
    str_squish
  
  # create and return tibble
  tibble(
    title = titles,
    artist = artists,
    medium = medium,
    location = location, 
    date = date
  )
}
