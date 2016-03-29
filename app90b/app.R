#### server
server <- function(input, output, session) {
  print(getwd())
}

#### user interface
ui <- fluidPage(

 includeCSS("style.css"),
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Sidebar title")
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