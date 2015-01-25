# Introduction

The script `run_analysis.R` performs the 5 steps defined for the project

* First, all the required data is merged into one data set with the proper column names for easier analysis later.

* Then the data set is filtered proper type of data (activity, subject, mean() data and std() data);

* Third, Activity data (id) is then replaced with the proper activity names.

* From the valid data set, the column names are fixed for better human understanding for a cleaner tidy table.

* Lastly, The average for each activity per subject is calculated and exported as a table into its own file knowing the valid columns are 3 to 68. The exported data is uploaded with the project submission and with the repo.

# Variables

##Step 1 and 2
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the original source in table format as a data_frame. Setting numeric class loads data faster.
* colnames are used to define the proper column names ahead of time.
* `features` contains the names for the `x_test` and 'x_train' datasets, later used to clean the data. done in step 1 but required in step 4.
* `training_data` and 'test_data' merge the initial datasets with appropriate column names for further analysis.
* 'full_data' is the combined 'test_data' and the 'training_data'.
* 'valid_full_data' holds the required columns defined in step 2.

##Step 3
* 'activities' contains the map for activity id to activity name to clean the data in step 3.

##Step 4
* newColNames is used to modify and clean the column names to a more human friendly format.

##Step 5
*`ddply()` from the plyr package is used to calculate the averages for the data set per activity per subject.
* lastly, `avg_data_set` contains the averages for the activity per subject to be later stored in a `.txt` file.
