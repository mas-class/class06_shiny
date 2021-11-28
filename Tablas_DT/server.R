
library(shiny)
library(dplyr)
library(ggplot2)
library(DT)

shinyServer(function(input, output) {
  
  #ejemplo tabla 1
  output$tabla1 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(rownames = FALSE, 
                    filter = 'top',
                    options = list(
                      pageLength = 10, 
                      LengthMenu = c(5, 10, 15))
                    )
    
  })
  
  #ejemplo tabla 2, me permite seleccionar multiples
  output$tabla2 <- DT::renderDataTable({
    diamonds %>%
      mutate(volumen = x*y*z,
             volumen_promedio = mean(volumen),
             volp = volumen/volumen_promedio) %>%
      DT::datatable(filter = 'top') %>%
      formatCurrency(columns= 'price', currency = "$") %>%
      formatPercentage(columns= 'volp', digits = 2) %>%
      #formatString(columns = 'volumen', suffix = ' mm^3') %>%
      formatRound(columns = c('volumen', 'volumen_promedio'), digits = 2)
      
    
  })
  
  # SELECCION DE FILAS
  #-----------------------------------------------------------------------------
  
  #ejemplo tabla, solo permite seleccionar una
  output$tabla3 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'single', target = 'row'))
    
  })
  
  #muestra en un recuadro las selecciones realizadas (unica)
  output$output1 <- renderPrint({
    input$tabla3_rows_selected
  })
  
  
  #ejemplo tabla, permite seleccionar una y multiples row
  output$tabla4 <- DT::renderDataTable({
    mtcars %>%
     DT::datatable(selection = list(mode= 'multiple', target= 'row'))
    
  })
  
  #muestra en un recuadro las selecciones realizadas (multiple)
  output$output2 <- renderPrint({
    input$tabla4_rows_selected
  })
  
  
  # SELECCION COLUMNA
  # ----------------------------------------------------------------------------
  
  #ejemplo tabla, solo permite seleccionar una
  output$tabla5 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'single', target = 'column'))
    
  })
  
  
  #muestra en un recuadro las selecciones realizadas (unica)
  output$output3 <- renderPrint({
    input$tabla5_columns_selected
  })
  
  
  #ejemplo tabla, permite seleccionar una y multiples columnas
  output$tabla6 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'multiple', target= 'column'))
    
  })
  
  #muestra en un recuadro las selecciones realizadas (multiple)
  output$output4 <- renderPrint({
    input$tabla6_columns_selected
  })
  
  
  # SELECCION CELDAS
  # ----------------------------------------------------------------------------
  
  #ejemplo tabla, solo permite seleccionar una
  output$tabla7 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'single', target = 'cell'))
    
  })
  
  
  #muestra en un recuadro las selecciones realizadas (unica)
  output$output5 <- renderPrint({
    input$tabla7_cells_selected
  })
  
  
  #ejemplo tabla, permite seleccionar una y multiples celdas
  output$tabla8 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'multiple', 
                                     target= 'cell'
                                     #solo permite seleccionar la matrix
                                     #selectable = matrix(c(1,1,2,2,3,3), nrow = 3, byrow = TRUE)
                                     
                                     #perimte pre-seleccionar
                                     #selected = matrix(c(1,1,2,2,3,3), nrow = 3, byrow = TRUE)
                                     ))
    
  })
  
  #muestra en un recuadro las selecciones realizadas (multiple)
  output$output6 <- renderPrint({
    input$tabla8_cells_selected
  })
  
  
  # SELECCION ROW+COLUMN
  # ----------------------------------------------------------------------------
  
  #ejemplo tabla, solo permite seleccionar una
  output$tabla9 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'single', 
                                     target = 'row+column'))
    
  })
  
  #muestra en un recuadro las selecciones realizadas (unica)
  output$output7 <- renderPrint({
    list(columns = input$tabla9_columns_selected, 
         rows = input$tabla9_rows_selected)
  })
  
  
  #ejemplo tabla, permite seleccionar una y multiples celdas
  output$tabla10 <- DT::renderDataTable({
    mtcars %>%
      DT::datatable(selection = list(mode= 'multiple', 
                                     target= 'row+column'))
    
  })
  
  #muestra en un recuadro las selecciones realizadas (multiple)
  output$output8 <- renderPrint({
    list(columns = input$tabla10_columns_selected, 
         rows = input$tabla10_rows_selected)
  })
  


})










