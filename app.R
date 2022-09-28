library(shiny)
library(brac)
library(future)
library(httr)
library(jsonlite)

ui <- fluidPage(
  titlePanel("advance r lab 5"),
  h1("brac shiny app"),
  sidebarLayout(
    sidebarPanel(selectInput("functionInput", "function",
                             choices = c("Server Ping" = pingToServer(),
                                         "Server time" = checkServerTime()))),
    mainPanel(dataTableOutput("table"))
  )
)

server <- function(input, output) {
  output$table <- renderDataTable(as.data.frame.AsIs(input$functionInput))
}
shinyApp(ui = ui, server = server)
