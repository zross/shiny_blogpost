server <- function(input, output, session) {
  
}

ui <- fluidPage(
  
  fluidRow(
    column(6, offset=1,
           h1("Title in one row")
    )
    
  ),
  fluidRow(
    column(
      actionButton("button", "Click")
      
    ),
    column(
      p("Row 2, Column 2 (button is col 1)")
    )
    
  )
)

shinyApp(ui = ui, server = server)