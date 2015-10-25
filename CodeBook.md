#Project description

This project tidies the data from the Human Activity Record study by [smartlab.ws](https://sites.google.com/site/smartlabdibrisunige/).

##Collection of the raw data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

##Train-test split

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##Data processing

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Feature preparation

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix `t` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: `-XYZ` is used to denote 3-axial signals in the `X`, `Y` and `Z` directions.

Note that all the observations are normalized to range between [-1:1].

##Data cleaning

The data was provided in semi-structured form as a collection of raw measurements and processed summaries. Please consult `UCI HAR Dataset/README.txt` and `UCI HAR Dataset/features_info.txt` for the description of the data prior to processing. 

For the summary purposes of the assignment, only the mean (`-mean()`) and standard deviation (`-std()`) observations were kept. All other features were removed.

##Creating tidy data

The data was processed with the `run_analysis.R` script in the following steps. Please consult the source code for the exact detail.

* Download the dataset from the course-provided resource
* Extract the data into `UCI HAR Dataset` in the local directory
* Read the activity and feature labels using the dataset's strucutre
* Filter to keep only the mean and standard deviation features
* Clean up the column names to be valid `R` identifiers
* Apply the above steps to both `train` and `test` datasets
* Write the merged data into `tidyData.txt`
* Summarize the data by taking the mean of each variable per subject per activity, and write it to `meanObservations.txt`

##Variable naming scheme

The variables are named according to the following schema:

The `_mean_` (mean) and `_std_` (standard deviation of the mean) of the different observations are recorded.

The triaxial components of each variable are recorded as `X`, `Y`, and `Z` in the variable name.

Where necessary, the components are decomposed into the `Gravity` and the `Body` component.

The accelerometer readings are denoted with `Acc`, the gyroscope readings are denoted with `Gyro`.

The eucledian norm of a measurement over all the axis in denoted as `Mag` (magnitude).

The `Jerk` is the derivative in time of the acceleration and angular velocity.

The time component variables are prepended with `t`, the frequency variables with `f`.

##Summarized data

The data is furthre summarized by getting the mean for each subject for each activity.

The column names are unchanged, but only one observation for each subject's activity is recorded. This data is saved into `meanObservations.txt`
