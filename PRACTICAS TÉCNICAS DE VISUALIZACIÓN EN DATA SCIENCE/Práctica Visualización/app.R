library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- shinyUI(
  fluidPage(
    plotOutput("Gráfica", hover = "clickGráfica"), #dblclick saca la informacion con doble click, click solo con uno solo y overclick te da la informacion al pasarlo por encima
    tableOutput("Jorge")
  )
)
   
# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
   output$Gráfica <- renderPlot({
     ggplot(mpg) + 
       geom_point(aes(x=cty, y=hwy))
   })
   output$Jorge <- renderTable({
     #toString(input$clickGráfica)
     #toString(nearPoints(mpg, input$clickGráfica))
     nearPoints(mpg, input$clickGráfica)
   })
   
})


# Run the application 
shinyApp(ui = ui, server = server)

