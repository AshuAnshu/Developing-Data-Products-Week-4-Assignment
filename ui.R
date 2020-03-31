
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/


library(shiny) 
library(ggplot2) 


shinyUI(fluidPage( 
    

    titlePanel(title = h3("mtcars data set Analysis", align="center")), 
    br(),   br(),  #line break

    # Sidebar with a slider input for number of Cylinders
    sidebarLayout(
        sidebarPanel(
            sliderInput("cylinders",
                        "Select number of Cylinders:",
                        min = 4,
                        max = 8,
                        value = 4, step=2
            ),
            
            br(),   br(),
            
            # Variable Selection 
            selectInput("var", "Select Variable from Dataset", 
                        choices=c("mpg"=1, "disp"=3, "hp"=4, "drat"=5, 
                                  "wt"=6, "qsec"=7, "vs"=8, "am"=9, 
                                  "gear"=10, "carb"=11), selected="mpg"
                        
            ),
            
            br(),   br()
            #------------------------------------------------------------------
            # Change background color for body
            #tags$style("body{background-color:lightyellow; color:brown}")
        ),
        
        mainPanel(
            tabsetPanel(type="tab",
                        tabPanel("Summary",verbatimTextOutput("sumry")),
                        tabPanel("Structure", verbatimTextOutput("struct")),
                        tabPanel("Data", tableOutput("displayData")),
                        tabPanel("Plot", plotOutput("mygraph"))
            )
        )
    ))
) 
