library(shiny)

shinyUI(fluidPage(
        
        theme=shinytheme('cerulean'), textOutput("currentTime"), 
          
  h1("SOLAR FLARES"),
  h3("From the RHESSI 6th Mission"),
  
  absolutePanel(top = '50%', left ='35%', width = 275,
   draggable = TRUE, class = "panel panel-default",

      selectInput('selectoption', 'Please select study Type',
                  choices=c('THE SUN','Is there a Solar Cicle?','How strong are the most frequent Solar Flares','How long are the Solar Flares'))),
  
      conditionalPanel(condition="input.selectoption=='THE SUN'",
                       tags$iframe(src="https://www.youtube.com/embed/cdKLSA2ke24", width=800,height=700)),

      
      conditionalPanel(condition="input.selectoption=='Is there a Solar Cicle?'",
                       sliderInput('bins','Please select Sample Size', min=1, max=200, value=100),
                       selectInput('colours3', 'Please choose a bin colour',
                        choices=c('yellow','red','blue','orange', 'purple')),
                       selectInput('back3', 'Please choose a background colour',
                         choices=c('lightblue','lightyellow','lightgreen','lightgrey'))),
 
 
      conditionalPanel(condition="input.selectoption=='How strong are the most frequent Solar Flares'",
                       selectInput('colours', 'Please choose a pie colour',
                        choices=c('yellow','red','blue','orange', 'purple')),
                       selectInput('back', 'Please choose a background colour',
                        choices=c('lightblue','lightyellow','lightgreen','lightgrey'))),
    
      
      conditionalPanel(condition="input.selectoption=='How long are the Solar Flares'",
                       textInput('number','Please select number of bins up to 100', 50),
                       selectInput('colours2', 'Please choose a bin colour',
                        choices=c('yellow','red','blue','orange', 'purple')),
                       selectInput('back2', 'Please choose a background colour',
                        choices=c('lightblue','lightyellow','lightgreen','lightgrey'))),
    
    mainPanel(
     plotOutput('distPlot'),
      width=100
      
    )
  )
)