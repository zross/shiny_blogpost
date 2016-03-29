#### server
server <- function(input, output, session) {
  
  # input$mytext comes from the UI. my_output_text gets
  # sent back
  output$my_output_text <- renderText({
    init <- "Your value is: "
    return(paste0(init, input$mytext))
    })
}

#### user interface
ui <- fluidPage(
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Sidebar title"),
      sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
                  max = 100, value = c(40, 60)),
      # mytext is sent to the server as input$mytext
      textInput(inputId = "mytext", label = "Text input", value = "Enter text...")
    ), #endsidebarpanel
    
    mainPanel(
      tabsetPanel(
        # textOutput is used to grab the result from the server
        tabPanel("Summary", textOutput("my_output_text")), 
        tabPanel("Plot"), 
        tabPanel("Table")
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)