function(input, output) {
    output$console_table <- renderDataTable(
        datatable(
            {consoles}, 
            filter = 'top'
        )
    )
    output$stock_table <- renderDataTable(
        datatable(
            {stocks}, 
            filter = 'top'
        )
    )
    output$trend <-renderPlotly({
        stock_trend <- stocks %>% filter(ticker == input$ticker)
        market_trend <- stocks %>% filter(ticker == input$market)
        consoles_point <- consoles
        if (input$manufacturer != "All") {
            consoles_point <- consoles_point %>% filter(manufacturer == input$manufacturer)
        }
        consoles_point <- merge(consoles_point, stock_trend, all.x=TRUE)
        consoles_point[is.na(consoles_point)] <- 0
        if (input$market != "None"){
            ggplot() +
                geom_line(data=stock_trend, aes(x=year, y=avg_close), color="#56B4E9", size=3) +
                geom_line(data=market_trend, aes(x=year, y=avg_close), color="gray", size=2) +
                scale_y_continuous(trans='log10') +
                geom_point(data=consoles_point, aes(x=year, y=avg_close, shape="Consoles"), size=3) +
                scale_x_continuous(breaks=stock_trend$year, 
                                   labels=substr(stock_trend$year,3,4),
                                   limits=c(min(stock_trend$year),max(stock_trend$year))) +
                expand_limits(y=0) +
                ggtitle(paste(input$ticker, "Stock Trend\n")) +
                xlab("Year") +
                ylab("\nAverage Close Price ($)\n") +
                theme(plot.title = element_text(size = 32, hjust = 0.5),
                      axis.text.x = element_text(size = 12, angle=45),
                      axis.text.y = element_text(size = 12),
                      axis.title.x = element_text(size = 20),
                      axis.title.y = element_text(size = 20),
                      panel.grid.minor.x = element_blank(),
                      rect = element_rect(fill = "transparent"),
                      legend.title=element_blank())
        } else {
            ggplot() +
                geom_line(data=stock_trend, aes(x=year, y=avg_close), color="#56B4E9", size=3) +
                geom_point(data=consoles_point, aes(x=year, y=avg_close, shape="Consoles"), size=3) +
                scale_x_continuous(breaks=stock_trend$year, 
                                   labels=substr(stock_trend$year,3,4),
                                   limits=c(min(stock_trend$year),max(stock_trend$year))) +
                expand_limits(y=0) +
                ggtitle(paste(input$ticker, "Stock Trend\n")) +
                xlab("Year") +
                ylab("\nAverage Close Price ($)\n") +
                theme(plot.title = element_text(size = 32, hjust = 0.5),
                      axis.text.x = element_text(size = 12, angle=45),
                      axis.text.y = element_text(size = 12),
                      axis.title.x = element_text(size = 20),
                      axis.title.y = element_text(size = 20),
                      panel.grid.minor.x = element_blank(),
                      rect = element_rect(fill = "transparent"),
                      legend.title=element_blank())
        }

    })
}