# DataProductsClassShinyApp
This Shiny App is for the Coursera Data Products Class. It predicts the probability of the presence of calcium oxalate crystals.
The idea is to use laboratory measurements for urine to predict the probability of these crystals being present. Calcium oxalate
is a common component of kidney stones. If the presence of such crystals are detected early, perhaps steps can be taken to
prevent them forming a kidney stone (an often painful condition).

The project contains the code for the app (ui.R and server.R) as well as the R Markdown file for the
original EDA (urine_eda.Rmd). It also contains the files for the R Studio Presenter presentation about the app.

The app is based on a logistic regression model built from the urine dataset in the SMPracticals library. 
(Credit: Andrews, D.F. and Herzberg, A.M. (1985) Data: A Collection of Problems from Many Fields for
 the Student and Research Worker. Springer-Verlag. Pages 249–251.)

This dataset consists of 79 instances of 6 laboratory measurements of urine and an indication of whether 
calcium oxalate crystals are present. The model was created using the 77 complete cases. 61 instances were
used to train the model, 16 for testing. The model chosen for this app was one of the models that had the
highest obtained accuracy score with the test data (93.75%). The best performing models contained either all the
covariates, or all covariates minus osmolarity, or all covariates minus conductivity. It was decided,
somewhat arbitrarily, to use the model with osmolarity instead of conductivity. This resulted in a predictor function
based on 5 measurements. The various models examined and their performance accuracy can be seen in urine_EDA.Rmd.

Link to ShinyApp at shinyapp.io: https://trier257.shinyapps.io/ProjShiny/

Link to RPubs presentation: http://rpubs.com/Trier/58801
