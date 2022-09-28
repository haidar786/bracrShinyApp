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
                             choices = c("Server Ping", "Server time"))),
    mainPanel(tableOutput("result"))
  )
)

server <- function(input, output) {
  print(input)
  print(output)
}
shinyApp(ui = ui, server = server)
