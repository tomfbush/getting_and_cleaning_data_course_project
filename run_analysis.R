##' You should create one R script called run_analysis.R that does the
##' following.

library(plyr)

## Step 1: merge training and data sets

## Set correct working directory if working locally
#'setwd("~/Google Drive/Home/Coursera/03_getting_and_cleaning_data/course_project/data")

## Read in row headings from features.txt. Sep='' means any number of spaces will work.
features <- read.csv('features.txt', header = FALSE, sep = '')

## Drop numbered column, retain second column only
features <- as.vector(features[,2])

## X_test and y_test don't contain headings; y_test data contains the headings for X_test
## so header = FALSE. Read in the features from vector created above
X_test <- read.csv('test/X_test.txt', header = FALSE, sep='', col.names = c(features))
y_test <- read.csv('test/y_test.txt', header = FALSE, col.names = 'Activity')

## Load in train data for each set
X_train <- read.csv('train/X_train.txt', header = FALSE, sep = '', col.names = c(features))
y_train <- read.csv('train/y_train.txt', header = FALSE, col.names = 'Activity')

## Load in subject data for each set and add Subject as column header
subject_train <- read.csv('train/subject_train.txt', header = FALSE, col.names = c('Subject'))
subject_test <- read.csv('test/subject_test.txt', header = FALSE, col.names = c('Subject'))

## Bind it all -- train and test belong above or below each other,
## so cbind their various parts first and then rbind

test_data <- cbind(X_test, y_test, subject_test)
train_data <- cbind(X_train, y_train, subject_train)
combined_data <- rbind(test_data, train_data)

## Step 2: extract only the measurements on the mean and standard deviation for each
## measurement, and keep the activity and subject columns added previously (also
## moves them to the first 2 columns)

sd_mean_data <- combined_data[,c(562, 563, grep("(mean|std)", names(combined_data)))]

## Step 3: Uses descriptive activity names to name the activities in the data set

## Read the activities file in, retaining the numbers for the later merge
activities <- read.csv('activity_labels.txt', header = FALSE, sep = "", colClasses = c('numeric', 'factor'), col.names = c("ActivityID","ActivityDescription"))

## Merge activities and the mean/SD data
merged_data <- merge(sd_mean_data, activities, by.x = "Activity", by.y = "ActivityID")

## Step 4: Appropriately label data

## Columns are already labelled using the features vector when data is loaded in
## above. However we do need to remove the 'Activity' column which is now not
## needed due to the work in step 3.

## Take on all columns except 1st

merged_data <- merged_data[,2:ncol(merged_data)]

## Step 5: From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

averages <- ddply(merged_data, .(Subject, ActivityDescription), function(x) colMeans(x[, 2:80]))

## Finally, write the data to a text file (for upload) using row.name=FALSE
write.table(averages, "averages.txt", row.name = FALSE)
