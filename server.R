library(shiny)
shinyServer(function(input, output, session){
  
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("Date and Time in NYC:", Sys.time())
  })

  output$distPlot=renderPlot({
    
    optiontype=input$selectoption
    
    if(optiontype=='How strong are the most frequent Solar Flares'){
      ggplot(Flares, aes(x = factor(energy.kev)), alpha=.25) +
        geom_bar(width = 1, color='red',fill=input$colours) + scale_y_log10() + coord_polar() + 
        labs(x='Energy Range in KiloElectronVolts', y='Quantity of Flares in Range') + ggtitle('Quantity of Flares in Ranges') +
        theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=22, hjust=0)) +
        theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=22)) +
        theme(panel.background = element_rect(fill=input$back)) +
        theme(panel.grid.major=element_line(colour = 'blue', linetype = 'dotdash')) +
        theme(panel.grid.minor = element_line(colour = 'blue', linetype = 'dotdash')) + 
        theme(plot.background = element_rect(fill = input$back))
      
      
    } else if(optiontype=='Is there a Solar Cicle?'){
      num_bin = as.numeric(input$bins)
      ggplot(data=Flares, aes(x=start.date), alpha=.25) + 
        geom_histogram(aes(y=..density..), color='red', fill=input$colours3, bins=num_bin) + 
        geom_density(colour="black", size=0.8, adjust=2)+
        labs(x='Time Line(2/12/2001-27/12/2016)', y='Quantity of Flares') + ggtitle('Flares Throughout the Years') +
        theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=32, hjust=0)) +
        theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=22)) +
        theme(panel.background = element_rect(fill=input$back3))+
        theme(panel.grid.major=element_line(colour = 'blue', linetype = 'dotdash')) +
        theme(panel.grid.minor = element_line(colour = 'blue', linetype = 'dotdash')) + 
        theme(plot.background = element_rect(fill = input$back3))
      
    } else if (optiontype=='THE SUN'){
      
    } else if (optiontype=='How long are the Solar Flares'){
      inputnumber=ifelse(as.numeric(input$number)>100,'100',input$number)
      ggplot(Flares,aes(x=abs(log(duration))))+
        geom_histogram(aes(y=..density..), bins=as.numeric(inputnumber), fill=input$colours2,col="red")+ 
        geom_density(colour="black", size=0.8,adjust=2) +
        ggtitle("Flares Duration") + labs(x= "Durarion of Flares",y= "Density")+
        theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=32, hjust=0)) +
        theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=22)) +
        theme(panel.background = element_rect(fill=input$back2))+
        theme(panel.grid.major=element_line(colour = 'blue', linetype = 'dotdash')) +
        theme(panel.grid.minor = element_line(colour = 'blue', linetype = 'dotdash')) +
        theme(plot.background = element_rect(fill = input$back2))
      
  
    }else if (optiontype=='The Data'){
      {output$flaresYo=DT::renderDataTable({lilflares})}
    }
  })
})