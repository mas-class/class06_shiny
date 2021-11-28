
library(shiny)
library(ggplot2)
library(tidyverse)

shinyUI(fluidPage(

    titlePanel("Interacciones del usuario con graficas"),
    tabsetPanel(
      tabPanel('Graficas Shiny',
               h1('graficas en shiny'),
               plotOutput('graficas_base_r'),
               plotOutput('grafica_ggplot')
               ),
      
      tabPanel('interacciones con plots',
               plotOutput("plot_click_option",
                          click = 'clk',
                          dblclick = 'dclk',
                          hover = 'mouse_hover',
                          brush = 'mouse_brush'),
               verbatimTextOutput('click_data'),
               tableOutput('mtcars_tbl')
               )
      
      )

))
