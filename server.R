library(shiny)
blues <- colorRampPalette(c("darkblue", "cyan"))
greys <- colorRampPalette(c(grey(0.4),grey(0.99)))

shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
    output$map <- renderPlot({
        atl<- getNOAA.bathy(input$long[1],input$long[2],input$lat[1],input$lat[2],resolution=input$res)
        plot.new()
        plot.window(xlim=input$long,
                    ylim=input$lat,
                    xaxs="i",
                    yaxs="i")
        axis(1);axis(2);box()
        plot.bathy(atl,
                   image = TRUE,
                   land = TRUE,
                   n=0,
                   bpal = list(c(0, max(atl), greys(100)),
                               c(min(atl), 0, blues(100))),
                   xaxt='n',
                   yaxt='n',
                   add=TRUE)
        # input$action <- 0
    })
})

