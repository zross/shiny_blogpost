#### server

server <- function(input, output, session) {
  
  
  observe({
    
    
    updateTextInput(session, "mytext", value=input$myslider)
  })
  
  dat <- reactive({
    input$myslider
    cars[1:input$myslider,]
    
  })
  
  output$mytable <- shiny::renderDataTable({
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
        tabPanel("Table", shiny::dataTableOutput("mytable"))
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)