server <- function(input, output, session) {
  
}

ui <- fluidPage(
  
  fluidRow(
    column(6, offset=1,
           h1("Title in one row")
    )
    
  ),
  fluidRow(
    column(1, class="col-xs-6", 
           actionButton("button", "Click")
           
    ),
    column(6, class="col-xs-6", 
           p("Row 2, Column 2 (button is col 1)")
    )

  )
)

shinyApp(ui = ui, server = server)