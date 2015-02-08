# DataProductsClassShinyApp
This Shiny App is for the Coursera Data Products Class. It predicts the probability of calcium oxalate crystals.

The app is based on a logistic regression model built from the urine dataset in the SMPracticals library. 
This dataset consists of 79 instances of 6 laboratory measurements of urine and an indication of whether 
calcium oxalate crystals are present. The model was created using the 77 complete cases. 61 instances were
used to train the model, 16 for testing. The model chosen for this app was one of the models that had the
highest obtained accuracy score with the test data (93.75%). The best performing models contained either all the
covariates, or all covariates minus osmolarity, or all covariates minus conductivity. It was decided,
somewhat arbitrarily, to use the model with osmolarity instead of conductivity.

Link to ShinyApp at shinyapp.io: https://trier257.shinyapps.io/ProjShiny/
