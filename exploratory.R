library(tidyverse)
library(ggplot2)
library(plotly)

stocks <- read.csv('data/stocks.csv')
consoles <- read.csv('data/consoles.csv')

stocks_trend <- stocks %>% filter(ticker == 'GME')
consoles_point <- consoles
consoles_point <- merge(consoles_point, stocks_trend, all.x=TRUE)
consoles_point[is.na(consoles_point)] <- 0

p <- ggplot() +
        geom_line(data=stocks_trend, aes(x=year, y=avg_close)) +
        geom_point(data=consoles_point, aes(x=year, y=avg_close)) +
        expand_limits(y=0) +
        xlim(min(stocks_trend$year),max(stocks_trend$year))
p <- ggplotly(p)
p