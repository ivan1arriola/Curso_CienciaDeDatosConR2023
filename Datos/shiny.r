ui <- fluidPage(
  sliderInput(inputId = "cant"
              ,
              label = "tamaño muestral:"
              ,
              min = 1,
              max = 500,
              value = 30),
  plotOutput(outputId = "hist")
)
server <- function(input, output) {
  output$hist <- renderPlot(
    {
      (hist(
        rnorm(input$cant))
       )
  })
}
shinyApp(ui, server)
