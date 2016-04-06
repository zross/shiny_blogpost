server <- function(input, output, session) {
  
}

ui <- basicPage(

  tags$head(
    tags$style(HTML("

      body {
        background-color: cornflowerblue;
        color: #6B1413;
      }

    "))
  ),
  
  h3("CSS using the HTML tag"),
  p("Some important text")

)

shinyApp(ui = ui, server = server)