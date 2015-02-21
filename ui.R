library(shiny)

shinyUI(
  pageWithSidebar(
    
    headerPanel("3 species of iris"),
    sidebarPanel(
      checkboxGroupInput("Species", label = h4("Pick the Species"), choices = levels(iris$Species)),
      actionButton("lr",label = h5("Draw Linear Regression Line")),
      radioButtons("xaxis", label= h4("Pick the variable for x-axis"), choices = names(iris[0:4])),
      radioButtons("yaxis", label= h4("Pick the variable for y-axis"), choices = names(iris[0:4]))
  ),
  
  mainPanel( 
    h3("Basic Introductory Reactive Plot"),
    div('Please note that this is a basic App intended to provide some introductory exploratory analysis.'),
    div('It uses the famous iris dataset, which you can simply download within R.'),
    h3("Getting Started with this Web App"),
    div('On the side panel you can pick any number of species and any two variables to draw the plot.'),
    div('You will be able to change the variables for X-axis and Y-axis.'),
    div('You may also click the button to draw the linear regression line on each plot.'),
    div('Correlation between the Length and Width for Petal and Sepal from each of 3 species.'),
    plotOutput('iris_plot')
    )))

  
  
  
