library(shiny)


shinyServer(function(input, output) {
    output$casesPlot <- renderPlot({
        #Validates that start and end date have been chosen
        validate(need(!is.na(input$date[1]) & !is.na(input$date[2]), "Error: You need to provide start and end date."))
        #Validates that the end date is later than the start date
        validate(need(input$date[1] < input$date[2], "Error: End date has to be greater than start."))
        #subsets the data to the desired date range
        subdata<-data_covid[as.Date(data_covid$date_case)>=input$date[1] & as.Date(data_covid$date_case)<=input$date[2],]
        par(mar = c(5, 4, 4, 4) + 0.3)
        plot( x=subdata$date_case,y=subdata$new_cases, type = typeDict[input$plotType], xlab="Date", ylab="Number of new cases/deaths")
        #Adds daily deaths curve
        if (input$new_deaths){
            lines(x=subdata$date_case,y=subdata$new_deaths, col="blue")
        }
        #Adds cumulative number of cases curve
        if (input$total_cases){
            par(new = TRUE)
            plot(x=subdata$date_case,y=subdata$total_cases, col="red", type = "l", axes = FALSE, 
                 bty = "n", xlab = "", ylab = "", lwd=3)
            axis(side=4, at = pretty(range(subdata$total_cases, na.rm = TRUE)))
            mtext("Total number of cases", side=4, line=3)
        }

    })

})
