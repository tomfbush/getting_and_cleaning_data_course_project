# Readme for course project

## Preparation

This readme sits in the repo at https://github.com/tomfbush/getting_and_cleaning_data_course_project

The main code is in `run_analysis.R`. In order to get this working it should be in the same folder as the `test` and `train` directories from the unpacked data. The data itself comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as per the assignment.

## Summary of the script

Summary of the things the script does to satisfy the requirements laid out by the assignment:

1. Merge training and data sets. I added the names of the features at this stage too by reading them from the file into a vector and using that to populate the column names for the data from X test/train.
2. Extract only the measurements on the mean and standard deviation for each measurement. This is achieved with a regular expression. 
3. Use descriptive activity names to name the activities in the data set. This is achieved by merging the `activity_labels.txt` and the data assembled in step 1.
4. Appropriately label data. This is mostly done by the inclusion of the `features` vector in step 1 but I did move some columns around here.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. This can be seen in `averages.txt`.

## Codebook

|Variable|Description|
|--------|--------------|
|activities|this contains the data from `activity_labels.txt`|
|averages|variable used to store the final output before writing to text file|
|combined_data|combination of x and y and train and test data made using rbind, prior to averaging or focusing on standard deviation or mean, prior to merging in the descriptive activity names|
|features|contains data from `features.txt` as a vector for use as column names for `X_test` and `X_train`|
|merged_data|sd_mean_data but including descriptive activity names|
|sd_mean_data|combined_data but after using reg exp to select only standard deviation or mean columns|
|subject_test, subject_train|details on who the subject was in each test read from `subject_train.txt` and `subject_test.txt`|
|test_data, train_data|combinations of `X_test` and `y_test`, or `X_train` and `y_train`|
|X_test, X_train|measurements data from `X_test.txt` and `X_train.txt`|
|y_test, y_train|activity data for each test, from `y_test.txt` and `y_train.txt`|
