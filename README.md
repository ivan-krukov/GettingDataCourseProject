#Cleaning Accelerometer Data

This repository contains a data-processing script for the UCI HAR dataset. 

#Source

The UCI HAR dataset is accelerometer data collected by `Smartlab` - Non Linear Complex Systems Laboratory. The data is human activity record, collected from subjects wearing a Samsung Galaxy S II phone. More information on the study design and the data [here](https://sites.google.com/site/harsmartlab/).

This project is completed as an assignment for "Getting and Cleaning Data" course at the John Hopkins Bloomberg school of Public Health though [Coursera](https://class.coursera.org/getdata-033)

#Running

The script `run_analysis.R` downloads and processes the data.

```
source("run_analysis.R")
```

#Data processing

The script will perform the following steps:

* Download the dataset from the course-provided resource
* Extract the data into `UCI HAR Dataset` in the local directory
* Read the activity and feature labels using the dataset's strucutre
* Filter to keep only the mean and standard deviation features
* Clean up the column names to be valid `R` identifiers
* Apply the above steps to both `train` and `test` datasets
* Write the merged data into `tidyData.txt`
* Summarize the data by taking the mean of each variable per subject per activity, and write it to `meanObservations.txt`

#Requirements

The script requires the `stringr` library

#Project description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Please consult the `CodeBook.md` for data processing and feature descriptions.

For more information, address the [Smartlab website](https://sites.google.com/site/harsmartlab/).