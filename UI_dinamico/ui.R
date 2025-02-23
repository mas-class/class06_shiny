
library(shiny)

shinyUI(fluidPage(

    #Ejemplo dinamico
    titlePanel("UI Dinamico"),
    tabsetPanel(tabPanel("ejemplo 1",
                         numericInput('min1', 'limite inferior', value = 5),
                         numericInput('max1', 'limite superior', value = 10),
                         sliderInput('slider1', 'seleccione valor',
                                     min = 0, max = 15, value = 5)
                         ),
                
                
                tabPanel("ejemplo 2",
                         sliderInput('s1', 'seleccione valor', min=-5, max=5, value=0),
                         sliderInput('s2', 'seleccione valor', min=-5, max=5, value=0),
                         sliderInput('s3', 'seleccione valor', min=-5, max=5, value=0),
                         sliderInput('s4', 'seleccione valor', min=-5, max=5, value=0),
                         actionButton('reset', 'reiniciar')
                         ),
                
                
                tabPanel("ejemplo 3",
                         numericInput('n', 'corridas', value=10),
                         actionButton('correr', 'correr')
                         ),
                
                
                tabPanel("ejemplo 4",
                         numericInput('nvalue', 'valor', value=0)
                         ),
                
                
                tabPanel("ejemplo 5",
                         numericInput('celcius', 'temperatura en celsius', value=NA),
                         numericInput('farenheit', 'temperatura en farenheit', value=NA)
                         ),
                
                
                tabPanel('ejemplo 6',
                         #generar un espacio
                         br(),
                         
                         #boton de seleccion
                         selectInput('dist', 'Seleccione Distribucion',
                                     choice= c('normal', 'uniforme', 'exponencial')),
                         
                         numericInput('n_random', 'Cuantos numeros aleatorios', value=100, min=0),
                         
                         #linea horizontal
                         hr(),
                         
                         #tabs
                         tabsetPanel(id= 'params', 
                                     type= 'hidden',
                                     tabPanel('normal',
                                              h1('Distribucion Normal'),
                                              numericInput('media', 'media', value=0),
                                              numericInput('sd', 'sd', value=1)
                                              ),
                                     tabPanel('uniforme',
                                              h1('Distribucion Uniforme'),
                                              numericInput('unif_min', 'minimo', value=0),
                                              numericInput('unif_max', 'maximo', value=1)
                                              ),
                                     tabPanel('exponencial',
                                              h1('Exponencial'),
                                              numericInput('razon', 'razon', value=1, min=0)
                                              )
                           
                         ),
                         plotOutput('plot_dist')
                  
                )
                
                )
    

))








