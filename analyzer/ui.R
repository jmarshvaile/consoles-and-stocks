header <- dashboardHeader(
    title = "Stock Analyzer"
)

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Introduction", tabName = "intro", icon = icon("comment")),
        menuItem("Trends", tabName = "trends", icon = icon("chart-line")),
        menuItem("Data Tables", tabName = "tables", icon = icon("table"),
                 menuItem("Console Data", tabName = "console-table"),
                 menuItem("Stock Data", tabName = "stock-table")),
        menuItem("Source code", icon = icon("file-code-o"), 
                 href = "https://github.com/jmarshvaile/consoles-and-stocks")
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "intro",
                h2("Video Game Consoles and the Stock Market"),
                h3("Purpose"),
                p("To answer whether the release of a video game console translates to increased stock price for companies with exposure to that market, such as GameStop, Target, Walmart, or BestBuy."),
                h3("Stocks"),
                p("A stock is a slice of ownership in a company. If you purchase a stock, you purchase ownership in 
                  that company. If you sell a stock, you sell your ownership."),
                h3("Stock Prices"),
                p("Stock prices are subject to the whims and emotions of the buyers and sellers involved. Just 
                  like on eBay or at an auction, if you want to sell something to another person, you determine the 
                  price by balancing what you think buyers will pay for it with how much you are willing to part with it. 
                  Because of this personal choice, an item sold at auction or on eBay may sell for completely different 
                  prices depending on the day and the people involved."),
                p("Just like an item sold at auction, it is not unusual to see the price of a stock change every day. 
                  It's not necessary for the underlying company's innate value to fluctuate objectively, just a change in  
                  the sentiment of the hundreds, thousands, or millions of part-owners."),
                h3("Console Release Cycle"),
                p("This is where the console release cycle comes in. For companies that rely on the release of a new 
                  console for profits, such as GameStop, there is a natural rise and fall in profits that corresponds with 
                  the release of new hardware. The year prior to the release of new hardware comes with lower profits 
                  while the year after brings increased profits."),
                h3("Priced by Sentiment"),
                p("But this objective dip and then rise in profits prior to the release of new hardware does not 
                  necessarily mean the stock price will follow suit. After all, stock prices are determined by 
                  sentiment, and watching as your company's profits drop sharply is a stressful experience. Do stock 
                  prices follow profits? Will prices decline before a console release, and rise after? Or will 
                  negative sentament win out and leave stock prices in decline.")
        ),
        tabItem(tabName = "trends",
                h2("Trends"),
                selectInput(
                    "ticker",
                    h5("Stock Ticker:"),
                    c("GameStop (retailer)" = "GME",
                      "Best Buy (retailer)" = "BBY",
                      "Target (retailer)" = "TGT",
                      "Walmart (retailer)" = "WMT",
                      "Microsoft (manufacturer)" = "MSFT",
                      "Sony (manufacturer)" = "SNE",
                      "Nintendo (manufacturer)" = "NTDOF")
                ),
                selectInput(
                    "market",
                    h5("Transform and Compare (will transform axis using log10 and compare to the selected market index):"),
                    c("None",
                      "SP500" = "^GSPC",
                      "DOW" = "^DJI",
                      "NASDAQ" = "^IXIC"
                    )
                ),
                selectInput(
                    "manufacturer",
                    h5("Consoles by Manufacturer:"),
                    c("All", unique(as.character(consoles$manufacturer)))
                ),
                plotlyOutput("trend", width = "100%", height = "400px")
        ),
        tabItem(tabName = "console-table",
                h2("Console Data"),
                dataTableOutput("console_table")
        ),
        tabItem(tabName = "stock-table",
                h2("Stock Data"),
                dataTableOutput("stock_table")
        )
    )
)

dashboardPage(header, sidebar, body)