#### server
server <- function(input, output, session) {
  
  # This render function has a reactive (input$mytext)
  # so it will run anytime the user makes a change
  output$my_output_text <- renderText({input$mytext})
  
  # This render function does not have a reactive so
  # it will run just on app load and then never again
  output$my_output_plot <- renderPlot({plot(1:10, 1:10, pch=16, col=1:10, cex=1:10)})
  
}

#### user interface
ui <- fluidPage(
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Sidebar title"),
      sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
                  max = 100, value = c(40, 60)),
      textInput(inputId = "mytext", label = "Text input", value = "Enter text...")
    ), #endsidebarpanel
    
    #!!!!!!!!! make the plot the active one 
    mainPanel(
      tabsetPanel(
        tabPanel("Summary", textOutput("my_output_text")), 
        tabPanel("Plot",    plotOutput("my_output_plot")), 
        tabPanel("Table")
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)