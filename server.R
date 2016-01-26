

#Loading packages
library(ggplot2)
library(scales)
library(UsingR)
library(shiny)

#Loading data
survey_data_all<-read.csv("survey_data.csv")
# survey_data<-survey_data
# load("survey_data_male.Rda")
# load("survey_data_female.Rda")
#Some messing around with charts


# Normal bar chart (with freqs)
shinyServer( function(input, output) {
  output$oid1_sex <- renderPrint({input$id1_sex})
  
  
  output$Hist <- renderPlot({
    
    if(input$id1_sex=="Male"){
      #load("survey_data_male.Rda")
      ggplot(read.csv("survey_data_male.csv"), aes(x = read.csv("survey_data_male.csv")$q4_appaltcity_move) ) +  
        geom_bar( stat="bin",position=position_dodge(), aes(y = ..count..*100/sum(..count..)), fill="firebrick")+  
        labs(x = "Would move for an apprenticeship (only male respondents)", y = "Percentage %") 
      
      }
    
   else if(input$id1_sex=="Female"){
     
     ggplot(read.csv("survey_data_female.csv"), aes(x = read.csv("survey_data_female.csv")$q4_appaltcity_move) ) +  
       geom_bar( stat="bin",position=position_dodge(), aes(y = ..count..*100/sum(..count..)), fill="dodgerblue4")+  
       labs(x = "Would move for an apprenticeship (only male respondents)", y = "Percentage %") 
    }
    
    
      else if (input$id1_sex=="Both") {
       
        #FOR SOME REASON I CANNOT READ IN THE DATA, ASSIGN IT TO survey_data_all AND THEN USE THIS OBJECT IN GGPLOT, ERROR MESSAGE "OBJECT NOT FOUND KEEPS COMING UP"  survey_data_all<-read.csv("survey_data.csv")
        
        ggplot(read.csv("survey_data_all.csv"), aes(x = read.csv("survey_data_all.csv")$q4_appaltcity_move, fill = sex) ) +  
        geom_bar( stat="bin",position=position_dodge(), aes(y = ..count..*100/sum(..count..)) )+  
        labs(x = "Would move for an apprenticeship", y = "Percentage %") +  
        scale_fill_manual("Sex", values = alpha( c("firebrick", "dodgerblue4"), 1) )
        
      }
      
### Might have a look at mouse over effects
#     output$click_info <- renderPrint({
#       cat("input$plot_click:\n")
#       str(input$plot_click)
#     })

  })
  
} )