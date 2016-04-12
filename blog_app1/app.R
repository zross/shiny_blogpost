library(shiny)

server <- function(input, output, session) { } #the server

ui <- basicPage("This is a real Shiny app") # the user interface

shinyApp(ui = ui, server = server) # this launches your app