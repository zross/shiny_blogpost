server <- function(input, output, session) {
  
  # With no priority specified the second observer will
  # run second and overwrite the first observer
  observe({
    txtA <- paste("First observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtA)
  })
  
  observe({
    txtB <- paste("Second observer", input$mytext)
    updateTextInput(session, inputId = "myresults", value = txtB)
  })
  
  
}

ui <- basicPage(
  h3("The value in the text box gets printed to the results text box."),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
)

shinyApp(ui = ui, server = server)