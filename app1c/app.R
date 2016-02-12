#### server
server <- function(input, output, session) {
  
}

#### user interface
ui <- fluidPage(

    fluidRow(
      column(6, offset=3,
             h1("This is my title in a row by itself with column 6 and offset 3")
             )
      
    ),
  fluidRow(
    column(3,
           h3("This could be a side panel (column 3)"),
           actionButton("button", "Click")
           
           ),
    column(6, 
           p("Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
             Eligendi quia officiis adipisci, harum necessitatibus earum, 
             veritatis et nihil iusto deleniti eaque repudiandae. Voluptatibus 
             cumque nesciunt neque fuga omnis nisi. Aliquam?")
           ),
    column(3,
           
           h3("Here is right side panel (column 3)"),
           sliderInput("slider", "My slider", 0, 10, 5)
           )
    
  )
)

shinyApp(ui = ui, server = server)