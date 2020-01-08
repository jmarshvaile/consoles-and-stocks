library(tidyverse)
library(ggplot2)
library(plotly)
library(DT)
library(shinydashboard)
library(shiny)

# stocks <- read.csv('data/stocks.csv')
# saveRDS(stocks, 'analyzer/data/stocks.RDS')
# consoles <- read.csv('data/consoles.csv')
# saveRDS(consoles, 'analyzer/data/consoles.RDS')

stocks <- readRDS('data/stocks.RDS')
consoles <- readRDS('data/consoles.RDS')