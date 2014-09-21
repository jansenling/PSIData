library(shiny)

shinyUI(fluidPage(
  ## Tille of application
  titlePanel("24-hr PSI monitor"),  ## PSI - Pollution Standards Index
  
  ## Sidebar with selecting input file in csv format
  sidebarLayout(
  sidebarPanel(
    fileInput('file1', 'Select 24-HR PSI.CSV File')
    
  ),
  
  # Show tabsets that includes a plot and table view
  mainPanel(
    tabsetPanel(type = "tabs", 

                ## Table -- shows the readings of PSI values from N,S,E,W and Central 
                ## over 24-hr period
                tabPanel("Table", tableOutput("contents")),                
                ## Plot - the output of number of occurences of the PSI for all regions
                tabPanel("Plot", plotOutput("plot")),
                ## Summary - summary readings of the PSI dataset
                tabPanel("Summary", verbatimTextOutput("summary"))
  )
  )
 )
))