---
title: "Readme"
date: "Monday, October 20, 2014"
output: html_document
---

# Read Me file for the Getting and Cleaning Data  Course Project

## Overview
The data for this project is from the publication "Human Activity Recognition on Smartphones using Multiclass Hardware" by David Anguita et al. [1].
The project was to read the data from this experiment, transform it as specified in the assignment, and create a new tidy data set.
Please refer to the **codebook.md** that describes the experiment and how the raw data was captured and estimated, transformed and the variables of the data.

## Installation
1. Set path to your working directory.
2. Download the file run_analysis.R to your working directory. This is the source code.
3. Download and unzip the file 
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory.
Your working directory  now has a folder called UCI HAR Dataset. It has two sub folders, **train and test**.


## Raw Data
The following files  in the UCI HAR Dataset folder are used to get the raw data for the project.
    1.  features.txt    It has  the numbered list of all the names of all the variables computed in the experiment.  
        This file has 561 variables.
    2.	activity_lablels.txt   Has activity numbers and names of the 6 activities performed by the subjects.
    3.	./train/subject_train.txt      Has a list of numbers, the IDs of the 21 people  who formed part of the train  
        data set.  
    4.	./train/X_train.txt   Has the values of the variables (as named in features.txt), for the train group. This 
        file has 7352 observations of 561 variables.
    5.	./train/y_train.txt  Has the activities corresponding to the train data set. (X_train and subject_train)
    6.	.test/ subject_test.txt     Has a list of numbers, the IDs of the 9 people  who formed part of the test data 
        set.  
    7.	.test/ X_test.txt   Has the values of the variables (as named in features.txt), for the test group. This file 
         has 2947 observations of 561 variables. 
    8.	.test/ y_test.txt   Has the activities corresponding to the test data set. (X_test and subject_test)
    
    Note: The files in the Inertial Signals folder are not used because the X_train and X_test have partially processed 
    data that is more user friendly and accurate.


## Dependencies
The run_analysis.R program uses the dplyr library. If not installed already,  the program will install the dplyr package.


## Running the Analysis
Run:
source("run_analysis.R")
A tidy data set called tidydata.txt will be created in the working directory.


## Viewing Results.
To view results:
results <-read.table("tidydata.txt, header = TRUE)
View(results)


## Algorithm
**Load Data**
  1. Read Features File. This file has the names of all variables computed in the experiment.
  2. Store the names of all features(variables) in a vector called variable name.
  3. From the test folder, read subject_test, X_test and y_test.
  4. Make them into one table, testtable using cbind.
  6. Give descriptive  names: subject, id and the variables from features.txt.
  7. From the train folder, read subject_train, X_train and y_train.
  4. Make them into one table, traintable using the cbind function.
  6. Give descriptive  names: subject, id and the variables from features.txt.

**Step 1**: 
  7. Merge testtable and train table into one. This table - testtrain has 563 columns and 10299 rows.

**Step 2** 
  8. Extract Required Columns (uses grepl and paste0 functions) 
  	 **Only variables that have mean() and std() in the column names are extracted.The feature_info.txt says that  
     meanFreq measurements are weighted averages and not arithmetic means. So they are excluded.**
		 **Angle measurements with the word Mean are excluded because they seem to measure the angle between 2 values, one 
     of which is a mean.**
	This results in a table of 68 columns, including subject and activity.

**Step 3**
	9. Read activity_labels.txt. This file has the names and identifiers for activities.
  11. Store the names of the activities in a vector called activity name.
	12. Convert the activity column to factor, with labels as in activity name.

**Step 4**
  13. Give Meaningful variable names. The choice of variable names and the naming convention are explained in the  
      codebook.md.

**Step 5**
  14. Group data by subject and activity using group_by function.
	15. Create a new table with the mean of each variable grouped by subject and activity. summarise_each is used to get 
      the result.
** Output Data**
  16.Write the tidy data to a text file tidydata.txt in the working directory.

 