# Load library dplyr for pipe
library(dplyr)

# Load library rvest for web scraping
library(rvest)

# Load webpage
page.url <- 'https://en.wikipedia.org/wiki/Gun_violence_in_the_United_States_by_state'
page.html <- page.url %>% read_html()

# Find all tables in the page
page.tables <- page.html %>% html_nodes('table')

# Get second table
page.table <- page.tables[[2]]

# Convert table to dataframe
page.data <- page.table %>% html_table()
class(page.data)

# View dataset sample
head(page.data)

# Assign better column names
names(page.data) <- c('state', 'population', 'total',
                      'murders', 'murders.gun', 'ownership.gun',
                      'rate.total', 'rate.murder', 'rate.murders.gun')
head(page.data)
