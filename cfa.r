#
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# calculate the Confirmatory Factor Analysis (CFA) 
#
# by Marcus Sandri
#    @Marcus1911
#
# 
# To run, make sure to get the correct table format (xls) and then, deploy it!  
# #TODO: pls, make it CI/CD
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


#Importing Dataset
input_data <- read.csv("~/Fanny/data_purified.csv", header=FALSE, sep=";")
  View(input_data)
  
# uncomment if there's no installed pkg: 
# install.packages("sem")
# install.packages("lavaan")
# install.packages("semPlot")

library(sem)
library(lavaan)
library(semPlot)

# fit the model to CFA equations
# This first iteration run with all variables
  
model <-  '
      Depress        =~ V30               
      Anxiety        =~ V27               
      PTSD           =~ V3 + V4 + V23 + V32 
      Anger          =~ V19 + V28 + V33   
      Shame          =~ V6 + V20 + V34    
      Belonginess    =~ V1 + V7 + V35     
      Guilt          =~ V17 + V36         
      Justice        =~ V9 + V24 + V37    
      Mesothelioma   =~ V12 + V14 + V22   
'


#Summarize 

fit <- cfa(model, data = input_data)

summary(fit, fit.measures = TRUE, standardized = TRUE)

#plot results
semPaths(fit, nCharNodes = 0, style = "lisrel", rotation = 2)



