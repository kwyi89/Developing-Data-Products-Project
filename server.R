library(shiny)

# Plotting 
library(ggplot2)

data(iris)

# Shiny server 
shinyServer(function(input, output) {
  
      output$iris_plot <- renderPlot({
        
    if(is.null(input$Species))
        return()    
    sp <- iris[iris$Species %in% input$Species,]
    
    # Draw a plot for any checked iris species. 
    if(is.null(input$xaxis))
      return()
    if(is.null(input$yaxis))
      return()
    
    g <- ggplot(sp, aes_string(x= input$xaxis, y=input$yaxis)) +
        geom_point(data = sp, aes(shape = factor(Species), colour=Species)) +  
        facet_grid(Species ~ .)
    
    print(g)
    
    # The action button's initial value is set to 0 and the increment increases by 1 each time it is clicked.
    # Use this logic to make the button capable of both drawing and removing the linear regression line. 
    if((input$lr)%%2==0)
      return()
    
    isolate({lm <- g + geom_smooth(data = sp, aes(colour=Species), method=lm)
    print(lm)})
    
    
})

})
