#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$Plot <- renderPlotly({
    
    d <- diamonds[sample(nrow(diamonds), input$samplesize), ]

    fair <- d %>% filter(cut == "Fair")
    good <- d %>% filter(cut == "Good")
    verygood <- d %>% filter(cut == "Very Good")
    premium <- d %>% filter(cut == "Premium")
    ideal <- d %>% filter(cut == "Ideal")

    fig <- plot_ly(alpha = 0.6)
    fig <- fig %>% add_histogram(x = ~d$price, xbins=1000, name='all cuts')
    fig <- fig %>% add_histogram(x = ~fair$price, xbins=1000, name='fair')
    fig <- fig %>% add_histogram(x = ~good$price, xbins=1000, name='good')
    fig <- fig %>% add_histogram(x = ~verygood$price, xbins=1000, name='very good')
    fig <- fig %>% add_histogram(x = ~premium$price, xbins=1000, name='premium')
    fig <- fig %>% add_histogram(x = ~ideal$price, xbins=1000, name='ideal')
    
    fig <- fig %>%   layout(barmode = "overlay",
                            legendgrouptitle = "cut",
                            title = "Histogram of diamond price by cut",
                            xaxis = list(title = "Price",
                                         zeroline = FALSE),
                            yaxis = list(title = "Count",
                                         zeroline = FALSE))
    fig
    
  })
  
  output$Scatter <- renderPlotly({

    d <- diamonds[sample(nrow(diamonds), input$samplesize), ]

    fitModel <- lm(d$price ~ d$carat) %>% fitted.values()
    
    fig <- plot_ly(x = ~d$carat, y = ~d$price, mode = "markers") %>% 
      add_markers(y = ~d$price) %>% 
      add_trace(x = ~d$carat, y = fitModel, mode = "lines") %>%
      layout(showlegend = F)

    fair <- d %>% filter(cut == "Fair")
    good <- d %>% filter(cut == "Good")
    verygood <- d %>% filter(cut == "Very Good")
    premium <- d %>% filter(cut == "Premium")
    ideal <- d %>% filter(cut == "Ideal")

   fig

  })
  
  
  output$Ggplot <- renderPlotly({
    
    d <- diamonds[sample(nrow(diamonds), input$samplesize), ]
    
    fig <- ggplotly(
      ggplot(d, aes(x = carat, y = price, color = cut)) +
        geom_point(color = "#CC0000", shape = 1, size = 1) +
        geom_smooth(method = 'lm') 
    )

   fig
    
  })
  
    
})
