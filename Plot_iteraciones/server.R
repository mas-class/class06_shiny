
library(shiny)
library(ggplot2)
library(tidyverse)

shinyServer(function(input, output) {
  
  ## ejemplo grafic01
  output$graficas_base_r <- renderPlot({
    plot(mtcars$wt,
         mtcars$mpg,
         xlab = 'wt',
         ylab = 'millas por galon')
  })

  ## ejemplo grafic02
  output$grafica_ggplot <- renderPlot({
    diamonds %>%
      ggplot(aes(x=carat,
                 y=price,
                 color=color))+
      geom_point()+
      xlab('price')+
      ylab('kilates')+
      ggtitle('precio de diamante por kilates')
  })
  
  ## ejemplo
  output$plot_click_option <- renderPlot({
    plot(mtcars$wt,
         mtcars$mpg,
         xlab = 'wt',
         ylab = 'millas por galon')
  })
  
  
  ## ejemplo
  output$click_data <- renderPrint({
    list(
      click_xy = c(input$clk$x, input$clk$y),
      doble_click_xy = c(input$dclk$x, input$dclk$y),
      hover_xy = c(input$mouse_hover$x, input$mouse_hover$y),
      brush_xy = c(input$mouse_brush$xmin, input$mouse_brush$ymin,
                        input$mouse_brush$xmax, input$mouse_brush$ymax)
    )
    
  })
  
  
  ## Tarea
  output$mtcars_tbl <- renderTable({
    #df <- nearPoints(mtcars, input$clk, xvar = 'wt', yvar = 'mpg')
    df <- brushedPoints(mtcars, input$mouse_brush, xvar = 'wt', yvar = 'mpg')
    
  })
  


})
