#### server
server <- function(input, output, session) {
  
  # Notice that even if you only change the text box that the 
  # slider code also runs and gets changed. The reverse is also
  # true. You might want to isolate these pieces.
  observe({
    txt <- paste(input$mytext, sample(1:100, 1))
    val <- paste(input$myslider,  sample(1:100, 1), sep="-")
    
    res <- paste0("Text is ", txt, ". Slider val is ", val)
    updateTextInput(session, "myresults", value = res)
  })
}


ui <- basicPage(
  
  h3("The value in the text box gets printed to the results text box."),
  sliderInput("myslider", "A slider:", min=0, max=1000, value=500),
  textInput("mytext", "Input goes here"),
  textInput("myresults", "Results will be printed here", "Initial value")
  
)

shinyApp(ui = ui, server = server)