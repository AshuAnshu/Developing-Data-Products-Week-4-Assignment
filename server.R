# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    
    
    cols <- reactive({
        as.numeric(c(input$var))
        
    }) 
    
    mylabel <- reactive({
        lable <- "Plot for mtcars" 
        lable
    })  
    
    
    myFinalData <- reactive({
        
        finaldata1<- subset(mtcars, mtcars$cyl==input$cylinders)  
        
        finaldata2<- finaldata1[, c(1, sort(cols()))] 
     
        
        data.frame(finaldata2) 
        
    } ) 
    # Summary Tab
    rendersumry <- reactive({ summary(myFinalData())})
    
    output$sumry <- renderPrint({
        rendersumry()
    }) 
    
    # Structure Tab
    renderstr <- reactive({ str(myFinalData())})
    
    output$struct <- renderPrint({
        renderstr()
    }) 
    
    # "Data tab"
    output$displayData <- renderTable({
        myFinalData()
    }) 
    
    
    
    # Plot Tab
    output$mygraph <- renderPlot({
        plotdata <- myFinalData()
        plot(plotdata, col=c(1,2,3,4,5,6,7,8,9), main=mylabel())
    }) 
    
    
    
})
