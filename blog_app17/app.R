server <- function(input, output, session) {
  
  # first observer has lower priority so it runs second and will
  # overwrite the other observer
  observe({
    txtA <- paste("First observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtA)
  }, priority = 1)
  
  # second observer has higher priority so it will run first and
  # then be overwritten
  observe({
    txtB <- paste("Second observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtB)
  }, priority = 2)
  
}

ui <- basicPage(
  
  h3("The value in the text box gets printed to the results text box."),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
)

shinyApp(ui = ui, server = server)