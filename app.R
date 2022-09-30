library(shiny)
library(brac)
library(future)
library(httr)
library(jsonlite)

ui <- fluidPage(
  titlePanel("advance r lab 5"),
  h1("brac shiny app"),
  sidebarLayout(
    sidebarPanel(selectInput("menu", "function",
                             choices = c("Server Ping",
                                         "Server Time",
                                         "Symbol Order Book",
                                         "Symbol Trades",
                                         "Symbol Agg Trades",
                                         "Symbol Average Price",
                                         "Ticker 24h Price",
                                         "Ticker Price"))),
    mainPanel(dataTableOutput("table"))
  )
)

server <- function(input, output) {
  values <- reactiveValues()

  observeEvent(input$menu, {
    switch (input$menu,
            "Server Ping" = {
              values$df <- pingToServer()
            },
            "Server Time" = {
              values$df <- checkServerTime()
            },
            "Symbol Order Book" = {
              values$df <- fetchSymbolOrderBook(symbol = "BNBBTC")
            },
            "Symbol Trades" = {
              values$df <- fetchSymbolTrades(symbol = "BNBBTC", limit = 5)
            },
            "Symbol Agg Trades" = {
              values$df <- fetchSymbolAggTrades(symbol = "BNBBTC", limit = 5)
            },
            "Symbol Average Price" = {
              values$df <- fetchSymbolAveragePrice(symbol = "BNBBTC")
            },
            "Ticker 24h Price" = {
              values$df <- fetchTicker24hPrice(symbol = "BNBBTC")
            },
            "Ticker Price" = {
              values$df <- fetchTickerPrice(symbol = "BNBBTC")
            }
    )
  })

  output$table <- renderDataTable(values$df)
}
shinyApp(ui = ui, server = server)




