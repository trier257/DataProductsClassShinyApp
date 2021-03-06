Kidney Stones?  Predicting the Presence of Calcium Oxalate Crystals
========================================================
author: E. Hobbs
date: February 2015

The Problem
========================================================
![calcium oxalate kidney stones](stone-2.jpg)

<small>Image credit: <em><u>[Calcium oxalate crystals](http://www.kidneystoner.org/wp-content/uploads/2011/02/stone-2.jpg)</u> - <u>[kidneystoners.org](http://www.kidneystoners.org)</u></em></small>

***
- Do you know someone who has suffered the pain of kidney stones?
- Wouldn't it be good to predict the occurrence of crystals before they form a large stone?
- And wouldn't it be great to do this using simple laboratory test results?


The Prediction App
========================================================

- <u>[Kidney stones](http://en.wikipedia.org/wiki/Kidney_stone)</u> are formed with minerals from urine
- Calcium oxalate is a common component of kidney stones
- Laboratory measurements of a urine sample are entered in the app. <u>[Try it!](https://trier257.shinyapps.io/ProjShiny/)</u>
- The probability of calcium oxalate crystals being present is predicted
![prediction](predict.jpg)

*** 
![lab measurements](sliders.jpg)

Example Predictions
========================================================
- 5 measurements from a urine sample are used to estimate the <strong>probability of the presence of crystals</strong> of a typical mineral in kidney stones
  + Specific gravity, pH, osmolarity, urea concentration, and calcium concentration
  + The concentrations are in millimoles/L



```r
crystalPred(1.015,6.35,450,200,4.36)
```

```
[1] "78.17%."
```

```r
crystalPred(1.015,6.35,603,371,4.36)
```

```
[1] "11.46%."
```

Can We Believe the Model?
========================================================
* Data used to build the model:
  + 77 cases of 6 urine laboratory measurements (5 measurements used in model)
  + Indication of presence of calcium oxalate crystals
* [Several models](https://github.com/trier257/DataProductsClassShinyApp
) were fit with logistic regression on a training set of 61 instances of the original 77
* The model chosen had 93.75% accuracy applied to test set
* Unfortunately, the model missed one positive case for a false negative rate of 14.3%
* It looks promising but more data and testing are needed
* <small>Dataset credit: Andrews, D.F. and Herzberg, A.M. (1985) <em>Data: A Collection of Problems from Many Fields for the Student and Research Worker.</em> Springer-Verlag. Pages 249-251.</small>


