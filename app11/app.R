#### server

server <- function(input, output, session) {
  initial_list <- c("New York", "Philadelphia")
  
  selectChoices <- reactive({
    input$updateButton
    c(isolate(input$mytext), initial_list)
  })
  
  radioChoices <- reactive({
    c(input$myslider[1], input$myslider[2], round(rnorm(1),2))
  })
  
  
  output$my_output_text <- renderUI({
    list(
      selectInput(inputId = "myselect", label="", choices = selectChoices()),
      radioButtons(inputId = "myradio", label="", choices = radioChoices())
    )
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
      textInput(inputId = "mytext", label = "Text input", value = "Enter text..."),
      actionButton("updateButton", "Update list")
    ), #endsidebarpanel
    
    mainPanel(
      tabsetPanel(
        tabPanel("Summary", uiOutput("my_output_text")), 
        tabPanel("Plot"), 
        tabPanel("Table")
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)