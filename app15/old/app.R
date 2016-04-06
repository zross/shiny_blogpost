library(leaflet)
library(ggplot2)


#### server
server <- function(input, output, session) {
	
	dat<-reactive({
		long <- runif(input$myslider, -121, -77 )
		lat <- runif(input$myslider, 33, 48)
		val1 <- runif(input$myslider, 1, 50)
		val2 <- runif(input$myslider, 1, 50)
		data.frame(latitude = lat, longitude = long, val1, val2)
	})
	
	output$plot <- renderPlot({
		ggplot(dat(), aes(val1, val2)) + geom_point(color="orange")
	})
	
	output$table_brushedpoints <- renderTable({
		br <- brushedPoints(dat(), input$plot_brush)
		
		if (nrow(br) > 0){
			output$mymap <- renderLeaflet({
				leaflet(data = br) %>%
					addProviderTiles("CartoDB.Positron",
						options = providerTileOptions(noWrap = TRUE)) %>%
					addMarkers(~longitude, ~latitude) %>%
					setView(-98, 38.6, zoom=3)
			})
		} else {
			output$mymap <- renderLeaflet({
				leaflet(data = dat()) %>%
					addProviderTiles("CartoDB.Positron",
						options = providerTileOptions(noWrap = TRUE)) %>%
					addMarkers(~longitude, ~latitude) %>%
					setView(-98, 38.6, zoom=3)
			})
		}
		return(br[,c("val1", "val2")])
	})
}


#### user interface
ui <- fluidPage(
	
	titlePanel("Example of leaflet interactive map using brushing"),
	
	sidebarLayout(
		
		sidebarPanel(
			h3("Slider changes number of map points"),
			sliderInput(inputId = "myslider", "Number of points:",
				min = 5, max = 20, value = 10, step = 1),
			plotOutput("plot", height = 250,
				brush = brushOpts(id = "plot_brush", resetOnNew = TRUE,
					fill = "red", stroke = "#036", opacity = 0.3)),
			h4("Brushed points appear here"),
			tableOutput("table_brushedpoints")
		), #endsidebarpanel
		
		mainPanel(
			tabsetPanel(
				tabPanel("Map", leafletOutput("mymap"))
				
			)
		)#end mainpanel
	)# end sidebarlayout
)


shinyApp(ui = ui, server = server)