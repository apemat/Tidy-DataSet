#Load features and activity_labels files in order to get the names of features and activities
features <- read.table("features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

## 1. Gather the tests data
# Read the volunteers from tests dataset
# Read the activities file of tests data set
# Combine activities with their corresponding labels and rename the columns
subjects_test <- read.table('test/subject_test.txt', stringsAsFactors = FALSE)
activities_test <- read.table('test/y_test.txt')
activities_test <- merge(activities_test, activity_labels, by = "V1", sort = F) 
colnames(activities_test) <- c("id","name")

# Creation of data_test with subject, activities and features values
data_test <- read.table('test/x_test.txt', stringsAsFactors = FALSE)
data_test <- cbind(data_test[, grepl("\\bmean()\\b", features$V2)], data_test[, grepl("\\bstd()\\b", features$V2)])
data_test <- cbind(subjects_test, activities_test, data_test)
data_test <- subset( data_test, select = -id)   # Remove the id activity because is irrelevant

## 2. Gather the train data
# Read the volunteers from train dataset
# Read the activities file of train data set
# Combine activities with their corresponding labels and rename the columns
subjects_train <- read.table('train/subject_train.txt', stringsAsFactors = FALSE)
activities_train <- read.table('train/y_train.txt')
activities_train <- merge(activities_train, activity_labels, by = "V1", sort = F)
colnames(activities_train) <- c("id","name")

# Creation of data_test with subject, activities and features values
data_train <- read.table('train/x_train.txt', stringsAsFactors = FALSE)
data_train <- cbind(data_train[, grepl("\\bmean()\\b", features$V2)], data_train[, grepl("\\bstd()\\b", features$V2)])
data_train <- cbind(subjects_train, activities_train, data_train)
data_train <- subset( data_train, select = -id)    # Remove the id activity because is irrelevant

## 3. Creation final data_set with test and train data
dataset <- rbind(data_test, data_train)
# Assign column names to dataset
colnames(dataset) <- c('subject','activity','bodyAcc_mean_X','bodyAcc_mean_Y','bodyAcc_mean_Z','bodyAcc_std_X','bodyAcc_std_Y','bodyAcc_std_Z','gravityAcc_mean_X','gravityAcc_mean_Y','gravityAcc_mean_Z','gravityAcc_std_X','gravityAcc_std_Y','gravityAcc_std_Z','bodyAccJerk_mean_X','bodyAccJerk_mean_Y','bodyAccJerk_mean_Z','bodyAccJerk_std_X','bodyAccJerk_std_Y','bodyAccJerk_std_Z','bodyGyro_mean_X','bodyGyro_mean_Y','bodyGyro_mean_Z','bodyGyro_std_X','bodyGyro_std_Y','bodyGyro_std_Z','bodyGyroJerk_mean_X','bodyGyroJerk_mean_Y','bodyGyroJerk_mean_Z','bodyGyroJerk_std_X','bodyGyroJerk_std_Y','bodyGyroJerk_std_Z','bodyAccMag_mean','bodyAccMag_std','gravityAccMag_mean','gravityAccMag_std','bodyAccJerkMag_mean','bodyAccJerkMag_std','bodyGyroMag_mean','bodyGyroMag_std','bodyGyroJerkMag_mean','bodyGyroJerkMag_std','fBodyAcc_mean_X','fBodyAcc_mean_Y','fBodyAcc_mean_Z','fBodyAcc_std_X','fBodyAcc_std_Y','fBodyAcc_std_Z','fBodyAccJerk_mean_X','fBodyAccJerk_mean_Y','fBodyAccJerk_mean_Z','fBodyAccJerk_std_X','fBodyAccJerk_std_Y','fBodyAccJerk_std_Z','fBodyGyro_mean_X','fBodyGyro_mean_Y','fBodyGyro_mean_Z','fBodyGyro_std_X','fBodyGyro_std_Y','fBodyGyro_std_Z','fBodyAccMag_mean','fBodyAccMag_std','bodyBodyAccJerkMag_mean','bodyBodyAccJerkMag_std','bodyBodyGyroMag_mean','bodyBodyGyroMag_std','bodyBodyGyroJerkMag_mean','bodyBodyGyroJerkMag_std')

## 4. Calculate each mean of every measures, for each subject and activity
library(dplyr)  # Load library dplr
tidy_dataset <- tbl_df(dataset) # Create a table
tidy_dataset_mean <- tidy_dataset

# Group data_set by subject and activity and calculate mean of every feature
result_tidy <- tidy_dataset_mean %>% group_by(subject, activity) %>% summarise_each(funs(mean))
# Write the result into a file
write.table(result_tidy, "tidy_data_set.txt", row.names = FALSE)