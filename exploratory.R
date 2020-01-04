library(tidyverse)
library(ggplot2)

stocks <- read.csv('data/stocks.csv')
consoles <- read.csv('data/consoles.csv')

stocks %>%
  filter(ticker == 'NTDOF') %>%
  ggplot(aes(x=year, y=avg_open)) +
  geom_line()

consoles %>%
  filter(manufacturer == 'Nintendo') %>%
  ggplot(aes(x=release)) +
  geom_bar()
