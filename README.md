# Readme for course project

## Preparation

This readme sits in the repo at ______

The main code is in run_analysis.R. In order to get this working it should be in the same folder as the test and train directories from the unpacked data. The data itself comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as per the assignment.

## The script

Summary of the things the script does to satisfy the requirements laid out by the assignment:

1. Merge training and data sets. I added the names of the features at this stage too by reading them from the file into a vector and using that to populate the column names for the data from X test/train.
2. Extract only the measurements on the mean and standard deviation for each measurement. This is achieved with a regular expression. 
3. Use descriptive activity names to name the activities in the data set. This is achieved by merging the activity_labels.txt and the data assembled in step 1.
4. Appropriately label data. This is mostly done by the inclusion of the features vector in step 1 but I did move some columns around here.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. This can be seen in averages.txt.

## Codebook

The codebook 