library(tidyverse)

library(shiny)



ui <- fluidPage(
    titlePanel("Histograma"),
    radioButtons(
        inputId = "dist",
        label = "Distribucion",
        choices = c("Gamma", "Normal")
    ),
    sliderInput(
        inputId = "cant",
        label = "tamaño muestral:",
        min = 1,
        max = 500,
        value = 30
    ),
    numericInput(
        inputId = "media",
        label = "Media",
        value = 30
        
    ),
    numericInput(
        inputId = "desvio",
        label = "Desvio Estandar",
        min = 0,
        value = 30
        
    ),
    plotOutput("hist")
)


server <- function(input, output){
    output$hist <- renderPlot({
        if(input$dist == "Normal"){
            datos <- data.frame(
                x = as.numeric( 
                    rnorm(
                        input$cant,
                        mean = input$media,
                        sd = input$desvio
                    )
                )
            )
        } else
        {
            datos <- data.frame(
                x = as.numeric( 
                    rgamma(
                        input$cant,
                        shape = 1
                    )
                )
            )
        }
        
        ggplot(datos) + geom_histogram( 
                aes(x),
                col = 'darkgray', border = 'white'
            )
    })
}



shinyApp(ui, server)