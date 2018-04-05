#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dice Game Score Sheet"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("ones1","Number of ones", c(0:5)),
       selectInput("twos1","Number of twos",c(0:5)),
       selectInput("threes1","Number of threes",c(0:5)),
       selectInput("fours1","Number of fours",c(0:5)),
       selectInput("fives1","Number of fives",c(0:5)),
       selectInput("sixes1","Number of sixes",c(0:5)),
       numericInput("tkind","Three of a Kind",0,min=0,max=30,step=1),
       numericInput("fkind","Four of a Kind",0,min=0,max=30,step=1),
       checkboxInput("fullh","Full House",FALSE),
       checkboxInput("sstr","Small Straight",FALSE),
       checkboxInput("lstr","Large Straight",FALSE),
       checkboxInput("yaht","Five of a Kind",FALSE),
       numericInput("chance","Misc",0,min=0,max=30,step=1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h4(textOutput("p1one")),
       h4(textOutput("p1two")),
       h4(textOutput("p1three")),
       h4(textOutput("p1four")),
       h4(textOutput("p1five")),
       h4(textOutput("p1six")),
       h4(textOutput("subtotaltop")),
       h4(textOutput("bonus")),
       h3(textOutput("totaltop")),
       h4(textOutput("threekind")),
       h4(textOutput("fourkind")),
       h4(textOutput("fullhouse")),
       h4(textOutput("smallstr")),
       h4(textOutput("largestr")),
       h4(textOutput("fivekind")),
       h4(textOutput("misc")),
       h3(textOutput("totalbot")),
       h2(textOutput("total"))
    
    )
  )
))
