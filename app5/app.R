#### server
server <- function(input, output, session) {
  
  myresults <- reactive({
    paste(input$mytext, "reactive returns results")
  })
  
  observe({
    print(myresults())
  })
  
}

#### user interface
ui <- fluidPage(
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      # the title
      h3("Sidebar title"),
      #add a slider
      sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
                  max = 100, value = c(40, 60)),
      # a text input box
      textInput(inputId = "mytext", label = "Text input", value = "Enter text...")
    ), #endsidebarpanel
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot"), 
        tabPanel("Summary"), 
        tabPanel("Table")
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)