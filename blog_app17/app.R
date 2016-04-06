server <- function(input, output, session) {
  
  # this is my reactive function -- I'm using it to
  # isolate reactions related to the text box
  myresults <- reactive({
    paste(input$mytext, "reactive returns results")
  })
  
  observe({
    # The reactive will run each time the textbox changes and
    # print results to the console.
    txt <- myresults()
    updateTextInput(session, inputId = "myresults", value = txt) 
  })
  
}

ui <- basicPage(
  
    h3("Using a simple reactive."),
    textInput("mytext", "Input goes here"),
    textInput("myresults", "Results will be printed here", "Initial value")

)

shinyApp(ui = ui, server = server)