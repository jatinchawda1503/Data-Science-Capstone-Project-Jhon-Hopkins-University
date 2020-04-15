library(shiny)
library(shinythemes)
library(markdown)
library(dplyr)
library(tm)
library(shinyjs)
shinyUI(
    
    fluidPage( tags$head(
        tags$style(HTML("
      
      
      h1 {
        text-align:center;
        font-weight: 500;
        line-height: 1.6;
        color: #ffffff;
      }
      
      .col-sm-8{
      align-items:center;
      display:inline-grid;
      justify-content:center;
      width:100%;
      }
      
      #next{
      display:none; 
      }
      
      #prediction1{
      display:block;
      }
      
     
    "))
    ),
        
        h1("Next Word Predict"),
               theme = shinytheme("cyborg"),
                useShinyjs(),
               # extendShinyjs("www/main.js"),
                                    mainPanel(
                                    textInput("userInput",
                                              "Enter a word or phrase:",
                                              value =  "",
                                              placeholder = "Enter text here"),
                                    br(),
                                    actionButton("numPredictions","Predict",
                                                value = 1.0, min = 1.0, max = 3.0, step = 1.0),
                                    br(),
                                    
                                    h4("Input text"),
                                    verbatimTextOutput("userSentence"),
                                    br(),
                                    h4("Predicted words"),
                                    verbatimTextOutput("prediction1"),
                                    verbatimTextOutput("prediction2"),
                                    verbatimTextOutput("prediction3")
                                    #actionButton("next", "Next Word")
                    
                        
               )
              
    )
)