library(shiny)
shinyUI(fluidPage(
  titlePanel("Calcium Oxalate Crystal Predictor"),
  sidebarLayout(
    sidebarPanel(
      h3("Enter laboratory values for the following:"),
      sliderInput(inputId = "gravity",
                  label = "Specific Gravity:",
                  min = 1.005, max = 1.040, value = 1.018, step = 0.001),
      sliderInput(inputId = "pH", label = "pH:",
                  min=4.6, max=8.0, value=5.95, step=0.01),
      sliderInput(inputId="osmo", label="Osmolarity:",
                  min=187, max=1230, value=594, step=1),
      sliderInput(inputId="urea", label="Urea Concentration in mm/L",
                  min=10, max=620, value=255, step=1),
      sliderInput(inputId="calc", label="Calcium Concentration in mm/L",
                  min=1.45, max=14.4, value=3.16, step=0.01),
      p("If you do not have a value, leave as the default setting. If your value is below the minimum, use the minimum. If it is above the maximum, use the maximum.")
    ),
    mainPanel(
      img(src="stone-2.jpg", height=200,width=200),
      
      p("Kidney stones are mineral deposits in the kidney that can cause severe pain. Calcium oxalate is a common type of kidney stone. Some laboratory urine measurements ", 
        em("might"), " help predict if calcium oxalate crystals are present before pain occurs."),
      h4("Using this app:"),
      p(strong(span("Select", style="color:blue")), 
        " laboratory values at the right, and ",strong(span("click",style="color:blue"))," on Predict Probability below to obtain the estimated probability of the presence of calcium oxalate crystals."),
      h4('You entered these values:'),
      textOutput("ogravity"),
      textOutput("oph"),
      textOutput("oosmo"),
      textOutput("ourea"),
      textOutput("ocalc"),
      actionButton("goButton", strong(span("Predict Probability",style="color:blue"))),
      conditionalPanel(condition="input.goButton > 0",
        textOutput("oans")
      ),
      p(""),
      div("Note: pH impacts probability only in a few borderline cases. Changes in specific gravity, osmolarity, urea concentration and calcium concentration have a larger effect. Urea and calcium concentrations are measured in millimoles per liter.", style="font-size:small"),
      p(""),
      div("For more information, see ", 
          a("WebMD, Kidney Stones", href="http://www.webmd.com/kidney-stones/default.htm"), ", or ",
          a("Wikipedia, Kidney Stone", href="http://en.wikipedia.org/wiki/Kidney_stone"), ".", style="font-size:small"),
      p(""),
      div("Picture credit: ", a("kidneystoners.org", href="http://www.kidneystoners.org"), "- ",
          a("Calcium oxalate crystals", href="http://www.kidneystoner.org/wp-content/uploads/2011/02/stone-2.jpg"),
          style="font-size:x-small")
    )
  )
))