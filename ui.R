library(shiny)

shinyUI(fluidPage(
  ## Tille of application
  titlePanel("24-hr PSI monitor"),  ## PSI - Pollution Standards Index
  
  ## Sidebar with selecting input file in csv format
  sidebarLayout(
  sidebarPanel(
    fileInput('file1', 'Import 24-HR PSI dataset'),
    
    helpText("This is a simple Shiny app for reading a dataset",
             "(csv format) of Pollution Standard Index (PSI) ",
             "across 5 regions (N, S, E, W and Central) over ",
             "a 24-hour period. The application will first ",
             "import the sample csv (24-HR PSI.csv). "),
    helpText( "                                      "),
    helpText( " [Table] tab -- display a table of the dataset. "),
    helpText( "                                      "),
    helpText( " [Plot] tab -- plots of the PSI values vs freq. "),
    helpText( "                                       "),
    helpText( " [Summary] tab -- provide details such as",
             " means, meadian, min, max and quartile values.")
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