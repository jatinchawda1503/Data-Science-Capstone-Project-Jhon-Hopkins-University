#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
source("predict.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {

    output$userSentence <- renderText({input$userInput});
    
    observe({
        if (is.null(input$userInput) || input$userInput == "") {
            shinyjs::disable("numPredictions")
        } else {
            shinyjs::enable("numPredictions")
        }
        
       # shinyjs::onclick("numPredictions", info("numPredictions", "Hello!"))
    })
    # reactive controls
    observe({
        numPredictions <- input$numPredictions
        if (numPredictions == 1) {
            output$prediction1 <- reactive({predictNextWord(input$userInput, 1)})
            output$prediction2 <- NULL
            output$prediction3 <- NULL
            updateActionButton(session, "numPredictions", "Predict 2nd Word")
        } else if (numPredictions == 2) {
            output$prediction1 <- reactive({predictNextWord(input$userInput, 1)})
            output$prediction2 <- reactive({predictNextWord(input$userInput, 2)})
            output$prediction3 <- NULL
            updateActionButton(session, "numPredictions", "Predict 3nd Word")
        } else if (numPredictions == 3) {
            output$prediction1 <- reactive({predictNextWord(input$userInput, 1)})
            output$prediction2 <- reactive({predictNextWord(input$userInput, 2)})
            output$prediction3 <- reactive({predictNextWord(input$userInput, 3)})
            updateActionButton(session, "numPredictions", "Only three Prediction Can be displayed")
        }
    })
    

})
