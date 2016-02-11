library(plotly)
#### server
server <- function(input, output, session) {
  
  
  dat <- reactive({
    cars[1:input$myslider,]
    
  })
  
  output$myplot <- renderPlotly({
    p <- ggplot(dat(), aes(speed, dist)) + geom_point()
    p <- ggplotly(p)
    p
  })
}

#### user interface
ui <- fluidPage(
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Interact with slider and the text input and table change"),
      sliderInput(inputId = "myslider", label = "Limit the ", min = 0, 
                  max = 50, value = c(10))
    ), #endsidebarpanel
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotlyOutput("myplot"))
        
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)