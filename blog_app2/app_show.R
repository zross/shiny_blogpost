#### server
server <- function(input, output, session) {
  
}

#### user interface
ui <- fluidPage(
  
  titlePanel("App with simple layout"),
  
  sidebarLayout(
    
    sidebarPanel(width = 2, class = "col-xs-2",
      "Sidebar"
    ), #endsidebarpanel
    
    mainPanel(width = 4, class = "col-xs-4",
      "This is the main panel"
    )#end mainpanel
  )# end sidebarlayout
)

shinyApp(ui = ui, server = server)