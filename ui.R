library(shiny)


survey_all<-read.csv("survey_data.csv")

# load("data/survey_data.Rda")
# load("data/survey_data_male.Rda")
# load("data/survey_data_female.Rda")

shinyUI(
  fluidPage( 
  titlePanel("Results of a survey on geographic mobility of potential apprentices in Germany"), 
  navlistPanel(
  
      tabPanel("Intro",
                   p("This Shiny app presents some results of a survey among young adults looking starting an apprenticeship in Germany")),
                   
      tabPanel("Question 1",
            selectInput("id1_sex", "Select male and/or female respondents", c("Male" = "Male", "Female" = "Female", "Both"="Both")),
        
      
            #h4('You selected '), verbatimTextOutput("oid1_sex"),
            #verbatimTextOutput("click_info"),
            plotOutput("Hist"#,               '
                       #click = "plot_click"
                       
            ),
            p("For an apprenticeship in your preferred profession with an attractive employer: would you move to a city more than 100 km from your home town?")
            
          ),
      tabPanel("Outro",
               p("That's it. Bye!")
               )
    )
  
  
)
)
