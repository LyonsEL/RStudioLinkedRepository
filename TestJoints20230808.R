#load tidyverse and readxl libraries
library(tidyverse)
library(readxl)

#Goal of this code: 
#Test and then implement joining relational data with dplyr and tidyverse
#Mutating joins adds new variables to one data from from matching observations in another
#The goal is to add the variant genomic, cDNA and protein notations to the relational data frame 
#that has the patient ID, symptom, and organ. First, create a smaller test dataset to train on. 

#creating a simulation dataset for the PatientID, VariantNames, and DataIDontWantToXfer
#example can be read about on https://bookdown.org/hneth/ds4psy/5-2-tibbles-essentials.html 
TestDataframe1 <- tibble(
  'PatientID' = c("PatientID1", "PatientID2", "PatientID3", "PatientID4"), 
  'VariantNames' = c("c.831A>G", "p.W194H", "8001393193932T>C", "IVS5+3A>G"), 
  'DataIDontWantToXfer' = c("United States", "Canada", "Mexico", "Argentina")
)
TestDataframe1

#creating a simulation dataset for the PatientID, symptom, and organ
TestDataframe2 <- tibble(
  'PatientID' = c("PatientID1", "PatientID1", "PatientID1", 
                  "PatientID2", "PatientID2","PatientID3", 
                  "PatientID3","PatientID3","PatientID3"),
  'Symptom' = c("inflammatory nodules","hoarseness", "arthritis",
                "motor deficit", "weakness", "nodules", 
                "contracture", "osteopenia", "respiratory distress"), 
  'Organ' = c("skin", "throat", "bone", 
              "muscle", "muscle", "skin", 
              "bone", "bone", "lungs")
)
TestDataframe2

#Matching joins, adding the VariantName from Dataframe1 into Dataframe2 
#Choosing a left_join where the left dataframe is the one with the variant IDs will alert me
#with the creation of an NA if any of the variant IDs lack symptom and organ 
#information (which they should all have).
TestJoin1 <- left_join(TestDataframe1, TestDataframe2, by = "PatientID")
TestJoin1

#selecting only the columns we want, not the columns we don't
TestSelect1 <- select(TestJoin1, PatientID, VariantNames, Symptom, Organ)
TestSelect1

#importing dataframe1 that has PatientID, VariantNames, and DataIDontWantToXfer
ASAH1PatientIDsVariantsOnly20230808 <- read_excel("~/Library/CloudStorage/OneDrive-NationalInstitutesofHealth/Research Summaries/Farber Disease Research Summaries/VariantAnalysis/JoiningDataForOrganAnalysis/ASAH1PatientIDsVariantsOnly20230808.xlsx")
View(ASAH1PatientIDsVariantsOnly20230808)

#import dataframe2 that has the PatientID, symptom, and organ
SymptomsByOrganForJoin20230808 <- read_excel("~/Library/CloudStorage/OneDrive-NationalInstitutesofHealth/Research Summaries/Farber Disease Research Summaries/VariantAnalysis/JoiningDataForOrganAnalysis/SymptomsByOrganForJoin20230808.xlsx")
View(SymptomsByOrganForJoin20230808)

#Matching joins, adding variant names from ASAH1PatientIDsVariantsForJoin20230808 to SymptomsByOrganForJoin20230808
Join1 <- left_join(ASAH1PatientIDsVariantsOnly20230808, SymptomsByOrganForJoin20230808, by = "PatientID")
Join1

