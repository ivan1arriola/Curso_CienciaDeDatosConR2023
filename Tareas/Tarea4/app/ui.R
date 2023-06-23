library(shiny)

fluidPage(
  
  titlePanel("Datos de Propina"),
  sidebarLayout(
    sidebarPanel(
      selectInput('varcolor', 'Variable en color', 
                  c("sexo", "fuma", "dia", "momento") ),
      actionButton("go", "Go"),
      actionButton("reset", "Clear")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Bivariado",
                 h2("Diagrama de dispersión", align = "center"),
                 plotOutput("scat"),
                 selectInput(
                   'digitos',
                   'Digitos',
                   0:2
                 ),
                 dataTableOutput("tabla")
        ),
        tabPanel("Univariado",
                 h2("Grafico de Barras", align = "center"),
                 plotOutput("bar")
        )
      )
    )
  )
)
