library(shiny)
library(marmap)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h1("Interactive marmap")),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("res", label = h3("Resolution"), min = 1, 
                           max = 120, value = 120),
      sliderInput("lat", label = h3("Latitude"), min = -90, 
                           max = 90, value = c(-90, 90)),
      sliderInput("long", label = h3("Longitude"), min = -180, 
                           max = 180, value = c(-180, 180)),
      submitButton("Plot")
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("map")
    )
  )
))