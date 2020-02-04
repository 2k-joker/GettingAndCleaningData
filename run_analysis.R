##This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

zipfile <- "ProjectData.zip"
#Check if zipfile already exists before downloading
if(!file.exists(zipfile)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, zipfile)
}

#Check if the files are unzipped 
if (!file.exists("UCI HAR Dataset")) { 
        unzip(zipfile) 
}

#Check if package is already installed 
if(!require("dplyr")){
                install.packages("dplyr")
                library(dplyr)
}
#We are going to use dplyr for this exercise
require("dplyr")

#loading required files
feat <- read.table("UCI HAR Dataset/features.txt", col.names = c("key", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names =c("key", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feat$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "key")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feat$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "key")

#extract mean and standard deviation variable names
mean_std <- grep("mean|std", feat$feature, value = TRUE)

#combine data into training and test data into one dataset
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_dataset <- cbind(subject, x, y)

#select variables of mean and standard deviation measurements 
data_extract <- merged_dataset %>% select(subject, key, everything(mean_std))

#rename acativities in dataset with descriptive names
data_extract$key <- activities[data_extract$key, 2]

#label dataset with descriptive variable names
tolower(names(data_extract))
names(data_extract)[2] = "activityLabel"
names(data_extract) <- gsub("acc", "accelerometer", names(data_extract))
names(data_extract) <- gsub("gyro", "gyroscope", names(data_extract))
names(data_extract) <- gsub("bodybody", "body", names(data_extract))
names(data_extract) <- gsub("mag", "magnitude", names(data_extract))
names(data_extract) <- gsub("^t", "time", names(data_extract))
names(data_extract) <- gsub("^f", "frequency", names(data_extract))
names(data_extract) <- gsub("tbody", "timebody", names(data_extract))
names(data_extract) <- gsub("-mean()", "mean", names(data_extract))
names(data_extract) <- gsub("-std()", "std", names(data_extract))
names(data_extract) <- gsub("-freq()", "frequency", names(data_extract))

#create second dataset with means grouped by subject and activities
summary_data <- data_extract %>% 
                group_by(subject, activityLabel) %>%
                summarize_all(funs(mean))

#save the dataset to disk as separate file
write.table(summary_data, "SummarizedData.txt")


                              



