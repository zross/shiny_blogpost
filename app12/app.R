#### server
server <- function(input, output, session) {
  
  # The function that creates several ui elements
  createSelectRadio <- function(id, title){
    
    selectID <- paste0("myselect", id)
    radioID <- paste0("myradio", id)
    checkID <- paste0("mycheck", id)
    
    res <- list(
      h2(title),
      selectInput(inputId = selectID, label="", choices = selectChoices()),
      radioButtons(inputId = radioID, label="", choices = radioChoices()),
      checkboxInput(inputId = checkID, label="", value=TRUE,)
    )
    
    return(res)
  }
  
  
  
  selectChoices <- reactive({c(input$mytext, initial_list)})
  radioChoices <- reactive({c(input$myslider[1], input$myslider[2], round(rnorm(1),2))})
  
  output$forPlot    <- renderUI({createSelectRadio(1, "In plot tab")})
  output$forSummary <- renderUI({createSelectRadio(2, "In summary tab")})
  output$forTable   <- renderUI({createSelectRadio(3, "In table tab")})
  
  
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
        tabPanel("Summary", uiOutput("forSummary")), 
        tabPanel("Plot",    uiOutput("forPlot")), 
        tabPanel("Table",    uiOutput("forTable"))
      )
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)