#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  model1 <- reactive({
    ones <- as.numeric(input$ones1)
    p1one <- paste("Total Ones:",ones*1)})
    
  model2 <- reactive({
    twos <- as.numeric(input$twos1)
    p1two <- paste("Total Twos:",twos*2)})
  
  model3 <- reactive({
    threes <- as.numeric(input$threes1)
    p1three <- paste("Total Threes:",threes*3)})
  
  model4 <- reactive({
    fours <- as.numeric(input$fours1)
    p1four <- paste("Total Fours:",fours*4)})
  
  model5 <- reactive({
    fives <- as.numeric(input$fives1)
    p1five <- paste("Total Fives:",fives*5)})
  
  model6 <- reactive({
    sixes <- as.numeric(input$sixes1)
    p1six <- paste("Total Sixes:",sixes*6)})
  
  modelsub <- reactive({
    sub <- as.numeric(input$ones1) + as.numeric(input$twos1) * 2 + 
      as.numeric(input$threes1) *3 + as.numeric(input$fours1) * 4 + 
      as.numeric(input$fives1) * 5 + as.numeric(input$sixes1) * 6
    subtot <- paste("Subtotal:",sub)})
  
  modelbon <- reactive({
    bon <- ifelse(as.numeric(input$ones1) + as.numeric(input$twos1) * 2 + 
                    as.numeric(input$threes1) *3 + as.numeric(input$fours1) * 4 + 
                    as.numeric(input$fives1) * 5 + as.numeric(input$sixes1) * 6 < 63, 0, 35)
    bonuslab <- paste("Bonus:",bon)})
  
  modelttot <- reactive({
    sub <- as.numeric(input$ones1) + as.numeric(input$twos1) * 2 + 
      as.numeric(input$threes1) *3 + as.numeric(input$fours1) * 4 + 
      as.numeric(input$fives1) * 5 + as.numeric(input$sixes1) * 6
    bon <- ifelse(sub <63, 0, 35)
    tot <- sub + bon
    totlab <- paste("Top Total:",tot)})
  
  modelfull <- reactive({
    full <- ifelse(input$fullh == FALSE, 0, 25)
    fullab <- paste("Full House (25):",full)
  })
  
  modelsmall <- reactive({
    small <- ifelse(input$sstr == FALSE, 0, 30)
    smalllab <- paste("Small Straight (30):",small)
  })
  
  modellarge <- reactive({
    large <- ifelse(input$lstr == FALSE, 0, 30)
    largelab <- paste("Large Straight (40):",large)
  })
  
  modelyaht <- reactive({
    yahtzee <- ifelse(input$yaht == FALSE, 0, 50)
    yahtlab <- paste("Five of a Kind (50):",yahtzee)
  })
  
  modelbtot <- reactive({
    btot <- as.numeric(input$tkind) + as.numeric(input$fkind) + ifelse(input$fullh == FALSE, 0, 25) + 
            ifelse(input$sstr == FALSE, 0, 30) + ifelse(input$lstr == FALSE, 0, 30) + 
            ifelse(input$yaht == FALSE, 0, 50) + as.numeric(input$chance)
    btotlab <- paste("Bottom Total:",btot)
  })
  
  modeltot <- reactive({
  
    tsub <- as.numeric(input$ones1) + as.numeric(input$twos1) * 2 + 
      as.numeric(input$threes1) *3 + as.numeric(input$fours1) * 4 + 
      as.numeric(input$fives1) * 5 + as.numeric(input$sixes1) * 6
    
    tbon <- ifelse(tsub <63, 0, 35)
    
    ttot <- tsub + tbon
    
    btot <- as.numeric(input$tkind) + as.numeric(input$fkind) + ifelse(input$fullh == FALSE, 0, 25) + 
      ifelse(input$sstr == FALSE, 0, 30) + ifelse(input$lstr == FALSE, 0, 30) + 
      ifelse(input$yaht == FALSE, 0, 50) + as.numeric(input$chance)
    
    tot <- ttot+btot
    totlab <- paste("Grand Total:",tot)
    
  })

  output$p1one <- renderText({model1()})
  output$p1two <- renderText({model2()})
  output$p1three <- renderText({model3()}) 
  output$p1four <- renderText({model4()}) 
  output$p1five <- renderText({model5()})
  output$p1six <- renderText({model6()})
  output$subtotaltop <- renderText({modelsub()})
  output$bonus <- renderText({modelbon()})
  output$totaltop <- renderText({modelttot()})
  output$threekind <- renderText({paste("Three of a Kind:",input$tkind)})
  output$fourkind <- renderText({paste("Four of a Kind:",input$fkind)})
  output$fullhouse <- renderText({modelfull()})
  output$smallstr <- renderText({modelsmall()})
  output$largestr <- renderText({modellarge()})
  output$fivekind <- renderText({modelyaht()})
  output$misc <- renderText({paste("Miscellaneous:",input$chance)})
  output$totalbot <- renderText({modelbtot()})
  output$total <- renderText({modeltot()})
})
  
