#### server

server <- function(input, output, session) {
  
  # return a list of UI elements
  observe({
    # the reactive here is not part of the calculation
    # but is added to so that the observer will run
    # any time the user interacts with the slider
    
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  dat <- reactive({
    input$myslider
    cars[1:input$myslider,]
    
  })
  
  output$mytable <- renderTable({
    dat()
  })
}

#### user interface
ui <- fluidPage(
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Interact with slider and the text input and table change"),
      sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
                  max = 50, value = c(10)),
      textInput(inputId = "mytext", label = "Text input", value = "Enter text...")
    ), #endsidebarpanel
    
    mainPanel(
      tabsetPanel(
        tabPanel("Summary"), 
        tabPanel("Plot"), 
        tabPanel("Table", tableOutput("mytable"))
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)