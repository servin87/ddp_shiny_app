library(shiny)

shinyUI(fluidPage(

    titlePanel("COVID-19 in Mexico"),

    sidebarLayout(
        sidebarPanel(
            #Plot type
            selectInput("plotType", 
                        label = "Type of plot for new cases:",
                        choices = c("Points", "Lines",
                                    "Bars"),
                        selected = "Bars"),
            #Date range
            dateRangeInput("date", strong("Select the date range"), start = "2020-01-01", end = "2020-09-12",
                           min = min(data_covid$date_case), max = max(data_covid$date_case)),
            #Add daily number of deaths
            checkboxInput(inputId = "new_deaths", label = strong("Add number of deaths", value=FALSE)),
            #Add cumulative number of cases
            checkboxInput(inputId = "total_cases", label = strong("Add cumulative number of cases", value=FALSE)),
            h4("Instructions"),
            h5("This app shows you a plot of new COVID-19 cases in Mexico as a function of time. You can choose between three types of plots: points, lines and bars."),
            h5("Use the 'Select the data range' input to limit the data to the dates of interest. Make sure your end date is greater than the start date, otherwise you will receive an error message."),
            h5("In addition, you can add a curve to show the number of deaths over time and one more curve to show the cumulative number of cases over time. The latter is plotted on a secondary vertical axis.")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("casesPlot")
        )
    )
))
