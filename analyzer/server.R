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
    output$test_plot <-renderPlot(
        {
        stocks_trend <- stocks %>% filter(ticker == input$ticker)
        consoles_point <- consoles
        if (input$manufacturer != "All") {
            consoles_point <- consoles_point %>% filter(manufacturer == input$manufacturer)
        }
        consoles_point <- merge(consoles_point, stocks_trend, all.x=TRUE)
        consoles_point[is.na(consoles_point)] <- 0
        
        ggplot() +
            geom_line(data=stocks_trend, aes(x=year, y=avg_close)) +
            geom_point(data=consoles_point, aes(x=year, y=avg_close)) +
            expand_limits(y=0) +
            xlim(min(stocks_trend$year),max(stocks_trend$year))
        }
    )
}