shinyServer(function(input, output) {
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    summary(PSIValues)
  })
  
  # Generate a plot of the data. Also uses the inputs to build
    # the plot label. 
    output$plot <- renderPlot({
    
      PSIValues<<-c("north"= as.numeric(test$North),"south"= as.numeric(test$South),"east"=as.numeric(test$East),"west"= as.numeric(test$West),"central"=as.numeric(test$Central))
      
      ## Plot all PSI values across all regions over 24-hours, 
      hist(PSIValues, xlab= "Pollution Standard Index (PSI)", main= "24-Hr PSI Across all regions[N,S,E,W & Central]")
            })
      
  
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name',  'datapath', seperator=csv 
    # The 'datapath' column will contain the local filenames where the 
    # data can be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
      test<<-read.csv(inFile$datapath, sep=",")
     
  })
  
})

