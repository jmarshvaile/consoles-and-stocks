header <- dashboardHeader(
    title = "Stock Analyzer"
)

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Research", tabName = "research", icon = icon("comment")),
        menuItem("Data Tables", tabName = "tables", icon = icon("table"),
                 menuItem("Console Data", tabName = "console-table"),
                 menuItem("Stock Data", tabName = "stock-table")),
        menuItem("Source code", icon = icon("file-code-o"), 
                 href = "https://github.com/jmarshvaile/consoles-and-stocks")
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "research",
                h2("Video Game Consoles and the Stock Market"),
                h3("Purpose"),
                p("To aid in speculative stock picks that have exposure to the video game console release cycle, such as GameStop, Target, Walmart, or BestBuy."),
                h3("Stocks"),
                p("A stock is..."),
                h3("Console Release Cycle"),
                p("The console release cycle is ..."),
                h3(""),
                p(""),
                h3(""),
                p(""),
                h3(""),
                p(""),
                h3("Trends"),
                selectInput(
                    "ticker",
                    h5("Stock Ticker:"),
                    c("GameStop (reseller)" = "GME",
                      "Best Buy (reseller)" = "BBY",
                      "Target (reseller)" = "TGT",
                      "Walmart (reseller)" = "WMT",
                      "Microsoft (manufacturer)" = "MSFT",
                      "Sony (manufacturer)" = "SNEJF",
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
                plotOutput("trend", width = "100%", height = "400px")
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