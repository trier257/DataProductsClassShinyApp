library(shiny)
crystalPred <- function(grVal,phVal,osVal,urVal,calcVal) {
  # This is the predict function based on the intercept and coefficients
  # generated from a logistic regression model built with the urine data
  # from the SMPracticals library.
  lcalcVal = log(calcVal+1)
  # The logistic regression predicts log odds.
  logOddsVal <- -618.538705 + 615.751235*grVal -0.339323*phVal -
    0.014567*osVal - 0.006383*urVal + 2.866842*lcalcVal
  # Convert to odds by exponentiating
  oddsVal <- exp(logOddsVal)
  # And convert odds to probability
  probVal <- oddsVal/(1+oddsVal)
  # Prettify the value for output
  retVal = paste(round(100*probVal, 2), "%.", sep="")
  return (retVal)
}
shinyServer(
  function(input,output) {
    # Had one instance where a value coming in was not set
    # This shouldn' happen, but just in case
    useGr<-reactive({
    if (length(input$gravity) < 1) {
      1.018
    } else {
      input$gravity
    }
    })
    usePH<-reactive({
      if (length(input$ph) < 1) {
        5.96
      } else {
        input$ph
      }
    })
    useOsmo<-reactive({
      if (length(input$osmo) < 1) {
        1230
      } else {
        input$osmo
      }
    })
    useUrea<-reactive({
      if (length(input$urea) < 1) {
        255
      } else {
        input$urea
      }
    })
    useCalc<-reactive({
      if (length(input$calc) < 1) {
        3.16
      } else {
        input$calc
      }
    })
    # Get the values input and show in output
    output$ogravity <- renderText({paste("Specific Gravity:",useGr())})
    output$oph <- renderText({paste("pH:", usePH())})
    output$oosmo <- renderText({paste("Osmolarity:", useOsmo())})
    output$ourea <- renderText({paste("Urea Concentration:", useUrea(), "mm/L")})
    output$ocalc <- renderText({paste("Calcium Concentration:", useCalc(), "mm/L")})
    # If the predict button is pressed, output the predicted probability
    output$oans <- renderText({
      input$goButton
      isolate(paste("Predicted probability of crystals is", 
                    crystalPred(useGr(),usePH(),useOsmo(),useUrea(),useCalc())
              ))
    })
  }
)