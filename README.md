# GettingAndCleaningData
## Course project
This script does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Dataset
  [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
## Major steps to follow
  1. Download the zipped folder and extract to a parent folder. You should have `UCI HAR Dataset`in the folder.  
  2. Set the parent directory as your working directory using the `setwd()`command.  
  3. Place the `run_analysis.R`file in the same parent folder as the dataset.  
  4. Run the `source("run_analysis.R")`. This will run the script and generate the `SummarizedData.txt`file into your working directory.  
## Packages and Dependencies
This script requires the use of `dplyr`package.The script installs and loads the package for you.
  
