# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)
library(glue)

# list of urls to be scraped ---------------------------------------------------

root <- "https://npg.si.edu/portraits/collection-search?page="
numbers <- seq(from = 1, to = 31, by = 1)
tail <- "&return_all=1&edan_local=1&edan_q=%252A%253A%252A&edan_fq%5B0%5D=p.edanmdm.indexedstructured.onphysicalexhibit%3AYes"
urls <- glue("{root}{numbers}")

# map over all urls and output a data frame ------------------------------------

npg_art <- map_dfr(urls, scrape_page)

# write out data frame ---------------------------------------------------------

write_csv(npg_art, path = "data/npg-art.csv")
