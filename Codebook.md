---
title: "Codebook"

date: "Saturday, October 25, 2014"
output: html_document
---

# Codebook for Tidy Data Project

## Table of Contents

  1.0 Source 
  2.0 The Experiment
  3.0  Raw Data
  4.0  Transformations
  5.0	Variables in the Tidy Dataset
      5.0.1	Variable Naming Convention
      5.0.2	Variable Names
      
## 1.0 Source: 

The data for this project is from the publication "Human Activity Recognition on Smartphones using Multiclass Hardware" by David Anguita et al. [1].

## 2.0 The Experiment:

It is described in: 

[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 
    1. A group of 30 volunteers were chosen as **subjects**. 
    2. Each person performed six **activities** - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,     
    LAYING while  wearing a smartphone (Samsung Galaxy S II) on the waist.
    3. Using its embedded devices accelerometer (Acc) and gyroscope (Gyro), 3-axial linear acceleration and 3-axial 
	  angular velocity are captured at a constant rate of 50Hz. 
    4. The obtained dataset is randomly partitioned into two sets, where 70% of the volunteers were selected for 
	  generating the training data (**train**) and 30% the test data (**test**). 
    5. These **time** domain signals, prefixed with t are filtered to separate them into **body** and **gravity** 
    acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ), time derived to get **Jerk** signals (tBodyAccJerk  
    -XYZ and tBodyGyroJerk-XYZ) and the **Magnitude** of these three-dimensional signals were calculated using the 
    Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
    6. A Fast Fourier Transform (FFT) is applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
    fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (The 'f'to indicate **frequency** domain  
    signals).
    7. Multiple statistical measurements such as **mean, std.deviation**, correlation, max, min etc are computed on  
    these variables. These are normalized and bounded within [-1,1]. 
    
    These statistical variables form the raw data for the project.

## 3.0 Raw Data

The raw data was downloaded from:

[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

The following files are used to get the raw data for the project.

    1.  features.txt    It has  the numbered list of all the names of all the variables computed in the experiment.       
    This file has 561 variables.
    2.	activity_lablels.txt   Has activity numbers and names of the 6 activities performed by the subjects.
    3.	subject_train.txt      Has a list of numbers, the IDs of the 21 people  who formed part of the train data set.  
    4.	train/X_train.txt   Has the values of the variables (as named in features.txt), for the train group. This file   
    has 7352 observations of 561 variables.
    5.	y_train.txt  Has the activities corresponding to the train data set. (X_train and subject_train)
    6.	subject_test.txt     Has a list of numbers, the IDs of the 9 people  who formed part of the test data set.  
    7.	X_test.txt   Has the values of the variables (as named in features.txt), for the test group. This file has 
    2947 observations of 561 variables. 
    8.	y_test.txt   Has the activities corresponding to the test data set. (X_test and subject_test)

## 4.0   Transformations
    The algorthm for data processing of is described in **Readme.md**.  The steps are explained in brief below 
    1.  Combine subject_train, X_train and y_train files to form one table. Name the columns using names from the 
    features.txt.
    2.	Combine subject_test, X_test and y_test files to form one table. Name the columns using names from the 
    features.txt.
    3.	Merge the two tables to form one.
    4.	Extract variables corresponding to mean and standard deviation. Note:
    Only those variables that use the mean() or std() are extracted. 
    meanFreq() measurements are NOT included because they are weighted averages. 
    Angle measurements are also excluded. 
    This subsets the data to 66 variables.    
    5.	Activities are labeled based on the activity_labels.txt.
    6.	Variable names are labeled as described in section 5.0
    7.	A new dataset is then made which has the average of each variable, grouped by subject and activity. 
    8.  This is written to a file called tidydata.txt which is uploaded to Coursera.


## 5.0   Variables in the tidy data set
  
## 5.0.1 Variable Naming Convention
    
Variables are named following the conventions set out in the Coursera video lecture "Editing Text Variables" 
with minimal changes.
    
    1. Variable names are descriptive and have the following components that show the source of the signal, the 
    domain of the signal and the processing, as described in section 2.0. 
    
    a.	Time: denotes time domain signal
    b.	Freq: denotes frequency domain signal
    c.	Body: denotes the body acceleration part of the signal
    d.	Gravity: denotes the gravity acceleration part of the signal
    e.	Acc: Accelerometer o/p
    f.	Gyro: Gyroscope o/p
    g.	Jerk: denotes the time derived acceleration o/p
    h.	Magnitude: Magnitude the 3 dimensional signal.
    i.	X, Y, Z: Axes of measurement
    j.	Mean: mean function
    k.	Std dev: standard deviation function 
    l.	averageof: denotes that the average of the variable is what is displayed.
    
    2. Hyphens, parentheses, and white spaces are removed
    
    3. Camel case is used because in this project the variables are more readable with camel case.
    
    Note: The variables have no units because they are normalized.
    
## 5.0.2 Variable Names
    
These are the variables in the tidy dataset - tidydata.txt  
    
    [1] "subject"                                 
    [2] "activity"                                
    [3] "averageofTimeBodyAccMeanX"               
    [4] "averageofTimeBodyAccMeanY"               
    [5] "averageofTimeBodyAccMeanZ"               
    [6] "averageofTimeBodyAccStddevX"             
    [7] "averageofTimeBodyAccStddevY"             
    [8] "averageofTimeBodyAccStddevZ"             
    [9] "averageofTimeGravityAccMeanX"            
    [10] "averageofTimeGravityAccMeanY"            
    [11] "averageofTimeGravityAccMeanZ"            
    [12] "averageofTimeGravityAccStddevX"          
    [13] "averageofTimeGravityAccStddevY"          
    [14] "averageofTimeGravityAccStddevZ"          
    [15] "averageofTimeBodyAccJerkMeanX"           
    [16] "averageofTimeBodyAccJerkMeanY"           
    [17] "averageofTimeBodyAccJerkMeanZ"           
    [18] "averageofTimeBodyAccJerkStddevX"         
    [19] "averageofTimeBodyAccJerkStddevY"         
    [20] "averageofTimeBodyAccJerkStddevZ"         
    [21] "averageofTimeBodyGyroMeanX"              
    [22] "averageofTimeBodyGyroMeanY"              
    [23] "averageofTimeBodyGyroMeanZ"              
    [24] "averageofTimeBodyGyroStddevX"            
    [25] "averageofTimeBodyGyroStddevY"            
    [26] "averageofTimeBodyGyroStddevZ"            
    [27] "averageofTimeBodyGyroJerkMeanX"          
    [28] "averageofTimeBodyGyroJerkMeanY"          
    [29] "averageofTimeBodyGyroJerkMeanZ"          
    [30] "averageofTimeBodyGyroJerkStddevX"        
    [31] "averageofTimeBodyGyroJerkStddevY"        
    [32] "averageofTimeBodyGyroJerkStddevZ"        
    [33] "averageofTimeBodyAccMagnitudeMean"       
    [34] "averageofTimeBodyAccMagnitudeStddev"     
    [35] "averageofTimeGravityAccMagnitudeMean"    
    [36] "averageofTimeGravityAccMagnitudeStddev"  
    [37] "averageofTimeBodyAccJerkMagnitudeMean"   
    [38] "averageofTimeBodyAccJerkMagnitudeStddev" 
    [39] "averageofTimeBodyGyroMagnitudeMean"      
    [40] "averageofTimeBodyGyroMagnitudeStddev"    
    [41] "averageofTimeBodyGyroJerkMagnitudeMean"  
    [42] "averageofTimeBodyGyroJerkMagnitudeStddev"
    [43] "averageofFreqBodyAccMeanX"               
    [44] "averageofFreqBodyAccMeanY"               
    [45] "averageofFreqBodyAccMeanZ"               
    [46] "averageofFreqBodyAccStddevX"             
    [47] "averageofFreqBodyAccStddevY"             
    [48] "averageofFreqBodyAccStddevZ"             
    [49] "averageofFreqBodyAccJerkMeanX"           
    [50] "averageofFreqBodyAccJerkMeanY"           
    [51] "averageofFreqBodyAccJerkMeanZ"           
    [52] "averageofFreqBodyAccJerkStddevX"         
    [53] "averageofFreqBodyAccJerkStddevY"         
    [54] "averageofFreqBodyAccJerkStddevZ"         
    [55] "averageofFreqBodyGyroMeanX"              
    [56] "averageofFreqBodyGyroMeanY"              
    [57] "averageofFreqBodyGyroMeanZ"              
    [58] "averageofFreqBodyGyroStddevX"            
    [59] "averageofFreqBodyGyroStddevY"            
    [60] "averageofFreqBodyGyroStddevZ"            
    [61] "averageofFreqBodyAccMagnitudeMean"       
    [62] "averageofFreqBodyAccMagnitudeStddev"     
    [63] "averageofFreqBodyAccJerkMagnitudeMean"   
    [64] "averageofFreqBodyAccJerkMagnitudeStddev" 
    [65] "averageofFreqBodyGyroMagnitudeMean"      
    [66] "averageofFreqBodyGyroMagnitudeStddev"    
    [67] "averageofFreqBodyGyroJerkMagnitudeMean"  
    [68] "averageofFreqBodyGyroJerkMagnitudeStddev"
    
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambie
