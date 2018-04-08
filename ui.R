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
    mainPanel(h6("The object of Yahtzee is to obtain the highest score from throwing 5 dice. The game consists of 13 rounds. 
                  In each round, you roll the dice and then score the roll in one of 13 categories. You must score once in each category. 
                  The score is determined by a different rule for each category.
                  The game ends once all 13 categories have been scored. 
                  If you score in the upper section of the table, your score is the total of the specified die face.
                  For 3 of a kind you must have at least 3 of the same die faces. You score the total of all the dice. For 4 of a kind you would need 4 die faces the same.
                  A Straight is a sequence of consecutive die faces, where a small straight is 4 consecutive faces, and a large straight 5 consecutive faces.
                  Small straights score 30 and a large 40 points.
                  A Full House is where you have 3 of a kind and 2 of a kind. Full houses score 25 points.
                  A Yahtzee is 5 of a kind and scores 50 points, although you may elect NOT to score it as a yahtzee, instead choosing to take it as a top row score and safegaurd you bonus.
                  You can roll anything and be able to put it in the Misc category. You score the total of the die faces.


"),
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
