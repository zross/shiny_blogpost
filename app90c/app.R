#### server
server <- function(input, output, session) {
  print(getwd())
}

#### user interface
ui <- fluidPage(
  
  titlePanel("My lovely app"),
  
  sidebarLayout(
    
    sidebarPanel(
      # CSS styling inline
      h3(style = "color:#35990d; font-family:'Comic Sans MS'", "Sidebar title")
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