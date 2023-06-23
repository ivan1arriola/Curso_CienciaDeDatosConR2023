library(shiny)
library(tidyverse)

propinas <- read_csv("propina.csv" )

server <- function(input, output){
  
  v <- reactiveValues(data = NULL)
  
  observeEvent(input$reset, {
    v$data <- NULL
  })  
  
  observeEvent(input$go, {
    v$data <- input$varcolor
  }) 
  
  output$scat <- renderPlot({
    if (is.null(v$data)) return()
    ggplot(data = propinas, 
           aes(x = total, y = propina, 
               colour = .data[[v$data]] ))+
      geom_point() + theme(aspect.ratio = 1) + 
      scale_x_continuous(name ="Total de la cuenta") +
      scale_y_continuous(name = "Propina") 
    
  })
  
  output$tabla <- renderDataTable({
    if (is.null(v$data)) return()
    propinas %>% 
      group_by(across(all_of(v$data))) %>% 
      summarise(mean_propina = mean(propina),
                sd_propina = sd(propina),
                mean_total = mean(total),
                sd_total = sd(total)
                
                ) %>% 
      mutate(across(where(is.numeric), round, as.numeric(input$digitos)))
  })

  output$bar <- renderPlot({
    if (is.null(v$data)) return()
    ggplot(data = propinas, 
           aes(x = .data[[v$data]] ))+
      geom_bar(
        aes(fill = .data[[v$data]])
      ) + theme(aspect.ratio = 1) + 
      scale_x_discrete(name = v$data) +
      scale_y_continuous(name = "Cantidad")
  })
}