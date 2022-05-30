---
title       : Week3 Data Products presentation
subtitle    : coursera
author      : Fred 
hitheme     : tomorrow      # 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
url:
#  lib: ../../libraries
  lib: ../../librariesNew
  assets: ../../assets
widgets     : [mathjax, quiz, bootstrap]
mode        : selfcontained # {standalone, draft}
---

```r
install.packages("devtools")
library(devtools)
```
```r
install_github('slidify', 'ramnathv')
install_github('slidifyLibraries', 'ramnathv')
```
```r
library(slidify)
```
```r
install.packages("plotly")
library(plotly)
```

## Getting started with Slidify

- Set the working directory to where you want to create your Slidify project

```r
setwd("~/Desktop/dev/R/JohnsHopkins DataScienceSpecialization/johnshopkins-data-science-specialization/work/09_DevelopingDataProducts/coursera_hopkins_developingdataproducts/week3")
```

- Create your project and give your project a name (My project is named "first_deck")

```r
author("first_deck")
```


## Plot

```r
library(mtcars)
plot_ly(mtcars, x = ~wt, y = ~mpg, type = "scatter", color = ~factor(cyl))
```


