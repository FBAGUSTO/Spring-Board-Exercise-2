## Load libraries
library(dplyr)
library(tidyr)

# titanic_original <- read.csv("titanic_original.csv", stringsAsFactors = FALSE)
titanic_original <- read.csv("C:/Users/fbagusto/Desktop/Data Analysis/Exercise 2/titanic_original.csv")
View(titanic_original) #

## Assigning the original data frame to a new data frame   
titanic_original2 <- titanic_original  


## 1: Port of embarkation
mask <- titanic_original2$embarked == ""
titanic_original2$embarked[mask] <- "S"


## 2: Age
## using mean
mean_age <- mean(titanic_original2$age, na.rm = TRUE)
titanic_original2$age[is.na(titanic_original2$age)] <- mean_age


## 3: Lifeboat
for(i in 1:length(titanic_original2$boat))
{
  if(titanic_original2$boat[i]=="")
  {titanic_original2$boat[i]<-"None"}
}

##titanic_original2$boat



## 4: Cabin
## Creating dummy variables for survivals with cabin numbers 
titanic_original2$has_cabin_number <- ifelse(titanic_original2$cabin == "", 0, 1)



## Specifying the objects in the  new dataframe
str(titanic_original2)

## Write the new dataframe to a cvs file called titanic_clean
write.csv(titanic_original2, file = "titanic_clean.csv")



