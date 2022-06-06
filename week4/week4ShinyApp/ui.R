#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Diamonds Visualization and Modeling"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("samplesize",
                        "Sample size:",
                        min = 1,
                        max = 53940,
                        # max = 1000,
                        value = 100)
        ),

        # Show a plot of the generated distribution
        # mainPanel(
        #     plotOutput("distPlot")
        # )
        # mainPanel(
        #   plotlyOutput("Plot")
        # ),
        
        tabsetPanel(
          tabPanel("Histogram", plotlyOutput("Plot")), 
          # tabPanel("Model", plotlyOutput("Scatter")),
          tabPanel("Linear Models", plotlyOutput("Ggplot"))
        )
        
    )
))
