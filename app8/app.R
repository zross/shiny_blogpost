#### server

server <- function(input, output, session) {
  initial_list <- c("New York", "Philadelphia")
  
  # return a list of UI elements
  output$my_output_text <- renderUI({
    
    # some developers use tagList instead of list
    # either will work
    list(
      h4("Nothing special"),
      selectInput(inputId = "myselect", label="", choices = c(input$mytext, initial_list))
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
      textInput(inputId = "mytext", label = "Text input", value = "Enter text...")
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