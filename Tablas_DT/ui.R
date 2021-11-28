
library(shiny)
library(DT)

shinyUI(fluidPage(

    titlePanel("Tablas en DT"),
    tabsetPanel(
      tabPanel('tablas DT',
               h1('vista basica'),
               DT::dataTableOutput('tabla1'),
               h1('filtro'),
               DT::dataTableOutput('tabla2')
               ),
      tabPanel('click en tablas',
               
# Seleccion por filas
#-------------------------------------------------------------------------------

               fluidRow(column(6, 
                               h2('Single Select Row'),
                               DT::dataTableOutput('tabla3'),
                               verbatimTextOutput('output1')
                               ),
                        column(6, 
                               h2('Multiple Select Row'),
                               DT::dataTableOutput('tabla4'),
                               verbatimTextOutput('output2')
                               )),

# seleccion columnas
#-------------------------------------------------------------------------------

            fluidRow(column(6,
                            h2('Single Select Column'),
                            DT::dataTableOutput('tabla5'),
                            verbatimTextOutput('output3')
                            ),
                     column(6,
                            h2('Multiple Select Column'),
                            DT::dataTableOutput('tabla6'),
                            verbatimTextOutput('output4')
                            )),

# seleccion celdas
#-------------------------------------------------------------------------------

            fluidRow(column(6,
                            h2('Single Select Cell'),
                            DT::dataTableOutput('tabla7'),
                            verbatimTextOutput('output5')
                            ),
                     column(6,
                            h2('Multiple Select Cell'),
                            DT::dataTableOutput('tabla8'),
                            verbatimTextOutput('output6')
                            )),


# seleccion row+column
#-------------------------------------------------------------------------------

          fluidRow(column(6,
                          h2('Single Select Row+Column'),
                          DT::dataTableOutput('tabla9'),
                          verbatimTextOutput('output7')
                          ),
                   column(6,
                          h2('Multiple Select Row+Column'),
                          DT::dataTableOutput('tabla10'),
                          verbatimTextOutput('output8')
                          ))










               )
      
    )

))






