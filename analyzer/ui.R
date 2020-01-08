header <- dashboardHeader(
    title = "Stock Analyzer"
)

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Data Tables", tabName = "tables", icon = icon("table"),
                 menuItem("Console Data", tabName = "console-table"),
                 menuItem("Stock Data", tabName = "stock-table")),
        menuItem("Source code", icon = icon("file-code-o"), 
                 href = "https://github.com/jmarshvaile/consoles-and-stocks")
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "dashboard",
                h2("Dashboard"),
                selectInput(
                    "ticker",
                    "Stock Ticker:",
                    unique(as.character(stocks$ticker))
                ),
                selectInput(
                    "manufacturer",
                    "Consoles by Manufacturer:",
                    c("All", unique(as.character(consoles$manufacturer)))
                ),
                box(plotOutput("test_plot"))
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