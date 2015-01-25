Getting and Cleaning Data - Course Project
===========================================

This repo hosts the proper script and documentation for running and understanding the code used to complete the project.

The dataset for this project is from: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset can be downloaded at: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

##Files (repo)

<b>The code takes uses all the data is present in the same folder, un-compressed and without names altered. Folder container the train and test data should be 'UCI HAR Dataset'</b>

CodeBook.md describes the steps taken to perform the tasks assigned in the project: gathering and loading data, translation of the data, cleaning of the data and explanation of the variables used through the project.

run_analysis.R script contains the code to perform the tidying of the data.

The cleaned dataset with the proper averages for the activities per subject was exported into the uploaded avg_data.txt file in table format without column headers.