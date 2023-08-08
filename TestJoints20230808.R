library(tidyverse)
#Test joining relational data with dplyr and tidyverse
#Mutating joins adds new variables to one data from from matching observations in another
#The goal is to add the variant genomic, cDNA and protein notations to the relational data frame 
#that has the patient ID, symptom, and organ. First, create a smaller test dataset to train on. 

#creating a simulation dataset for the PatientID, VariantNames, and DataIDontWantToXfer
#example can be read about on https://bookdown.org/hneth/ds4psy/5-2-tibbles-essentials.html 
Dataframe1 <- tibble(
  'PatientID' = c("Author1", "Author2", "Author3"), 
  'VariantNames' = c("c.831A>G", "p.W194H", "8001393193932T>C"), 
  'DataIDontWantToXfer' = c("United States", "Canada", "Mexico")
)
Dataframe1

#creating a simulation dataset for the PatientID, symptom, and organ
Dataframe2 <- tibble(
  'PatientID' = c("Author1", "Author1", "Author1", 
                  "Author2", "Author2","Author3", 
                  "Author3","Author3","Author3"),
  'Symptom' = c("inflammatory nodules","hoarseness", "arthritis",
                "motor deficit", "weakness", "nodules", 
                "contracture", "osteopenia", "respiratory distress"), 
  'Organ' = c("skin", "throat", "bone", 
              "muscle", "muscle", "skin", 
              "bone", "bone", "lungs")
)
Dataframe2
