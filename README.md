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
  1. Download the zipped folder and extract to a parent folder. You should have <mark style="background-color: lightblue">UCI HAR     Dataset</mark> in the folder.  
  2. Set the parent directory as your working directory using the <mark style="background-color: peach"> setwd()</mark> command.  
  3. Place the <mark style="background-color: lightblue">run_analysis.R</mark> file in the same parent folder as the dataset.  
  4. Run the <mark style="background-color: lightblue">source("run_analysis.R")</mark>. This will run the script and generate the <mark style="background-color: lightblue">SummarizedData.txt</mark> file into your working directory.  
## Packages and Dependencies
This script requires the use of <mark style="background-color: peach"> dplyr</mark> package.The script installs and loads the package for you.
  
