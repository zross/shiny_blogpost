server <- function(input, output, session) {
  
}

ui <- fluidPage(
                
                titlePanel("Include HTML elements"),
                
                sidebarLayout(
                  
                  sidebarPanel(
                      h3("Sidebar title")
                  ), #endsidebarpanel
                  
                  mainPanel(
                    h1("Title without tags$"),
                    tags$blockquote("But block quote requires tags$ Lorem ipsum dolor sit amet, consectetur 
                               adipisicing elit. Eligendi quia officiis adipisci, 
                               harum necessitatibus earum, veritatis et nihil iusto 
                               deleniti eaque repudiandae. Voluptatibus cumque nesciunt 
                               neque fuga omnis nisi. Aliquam?"),
                    h3("H3 is fine without tags and so is code here"),
                    code("data.frame(a=1:10, b=1:10)")
        
                  )#end mainpanel
                )# end sidebarlayout
)

shinyApp(ui = ui, server = server)