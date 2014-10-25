# Course Project for Getting and Cleaning Data
# run_analysis.R Program

#  This program processes the data from the Human Activity Recognition Using 
#  Smartphones experiment and outputs tidy data as specified in the experiment.
#  The input data files are downloaded  from 
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#  and unzipped in the working directory.

#  The program starts with loading data from working directory into R.
#  **Note: download.file and unzip functions are not included in this program.**

#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names. 
#  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#################################################################################

if(!require("dplyr")){
  install.packages("dplyr")
}
library(dplyr)

#Load Data from Working directory in to R

# Read Features File. 
# This file has the names of all variables computed by the experiment.

    features <- read.table("./UCI HAR Dataset/features.txt")

    # Store the names of all features(variables) in a vector.
    variablenames <-as.character(features$V2) 
    
# Read All Test files, combine them and give colnames.

    subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    X <- read.table("./UCI HAR Dataset/test/X_test.txt")
    Y <- read.table("./UCI HAR Dataset/test/y_test.txt")
    # Make Test table with Subject, Activity and features for subjects in Test category
    testtable <- cbind(subject, Y, X)
    colnames(testtable) <-c("subject","activity",variablenames)

# Read Train files, combine them and give colnames.

    subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    X <- read.table("./UCI HAR Dataset/train/X_train.txt")
    Y <- read.table("./UCI HAR Dataset/train/y_train.txt")
    # Make Train table with Subject, Activity and features for subjects in Train category
    traintable <- cbind(subject, Y, X)
    colnames(traintable) <- c("subject","activity",variablenames)


#  Step 1 Merge the files  

    testtrain <- data.frame()
    testtrain <- rbind(testtable,traintable)

#  Step 2 Extract Required Columns

# Only variables that have mean() and std() in the column names are extracted.
# The feature_info.txt says that meanFreq measurements are weighted averages.
# and not arithmetic means. So they are excluded.
# Angle measurements with the word Mean are excuded because 
# they seem to measure the angle between 2 values, one of which can be a mean.

    reqdpattern <- c("subject","activity","mean\\(\\)","std" ) 
    datasubset <- testtrain[, grepl(paste0(reqdpattern, collapse ="|"),colnames(testtrain))]

#  Step 3 Label Activities

    activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
    activityname <- as.character(activity$V2)
    datasubset$activity <- factor(datasubset$activity, labels = activityname)

#  Step 4 Give Meaningful Variable Names.

#  Descriptive names with no parantheses,periods,hyphens or whitespaces are given.
#  Camelcase is used because for this dataset it is more readable than having names in all lower case.
#  Abbreviations such as "Freq", "Acc", "Gyro" are used because they are human readable.
#  Expansions are used where necessary. Eg.time for t, Magnitude for Mag.
#  The string "BodyBody" found in some variable names is assumed to be an error.
#  and replaced with "Body".

    var1 <- colnames(datasubset)
    var1 <- gsub("^t","time", var1)
    var1 <- gsub("^f","freq", var1)
    var1 <- gsub("BodyBody","Body", var1) # this assumes that BodyBody is a typo.
    var1 <- gsub("Mag","Magnitude", var1)
    var1 <- gsub("std","Stddev", var1)
    var1 <- gsub("mean","Mean", var1)
    var1 <- gsub("\\(\\)", "", var1)
    var1 <- gsub("-", "", var1)
    colnames(datasubset)<-var1

# Make a tidy data table with the Average of variables  by Subject and Activity
# Group By Subject and Activity

    groupedsubset <- group_by(datasubset,subject, activity)

# Compute Average of each column of the grouped dataset.

    tidytable <- summarise_each(groupedsubset,funs(mean))

# Modify column names to indicate that they are now average values

    var1 <- colnames(tidytable)
    var1 <- gsub("^time", "averageofTime",var1)
    var1 <- gsub("^freq", "averageofFreq",var1)
    colnames(tidytable) <- var1

#Output Data

# Write to table

    write.table(tidytable, "./tidydata.txt", row.names= FALSE)


