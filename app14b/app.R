library(highcharter)
library(magrittr)
#### server
server <- function(input, output, session) {
  
  dat <- reactive({
    cars[1:input$myslider,]
    
  })
  
  output$myplot <- renderHighchart({
    p <- highchart() %>% 
      hc_title(text = "Scatter chart with size and color") %>% 
      hc_add_serie_scatter(cars$speed, cars$dist)
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
        tabPanel("Plot", highchartOutput("myplot"))
        
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)