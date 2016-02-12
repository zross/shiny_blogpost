library(shinythemes)
#### server
server <- function(input, output, session) {
  
}

#### user interface
ui <- fluidPage(theme=shinytheme("cosmo"),
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Sidebar title"),
      actionButton("button", "A button")
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