
# Code Book
## Overview
This code book that describes the data and any variables and transformations used to tidy the data and will follow the sequence used in the source code.


##Variables
* fileURL - character string containing the URL of the data file for download
* oldWorkingDir - character string used to store the working directory
* xTest - dataframe loaded from X_test.txt
* xTrain - dataframe created from X_train.txt
* yTest - dataframe loaded from Y_test.txt
* yTrain - dataframe with the contents of Y_train.txt
* subjectTest - dataframe holding the contents of subject_test.txt
* subjectTrain - dataframe loaded from subject_train.txt
* activityLabels - dataframe created from activity_labels.txt
* featureLabels - dataframe created from feature_labels.txt
* train - dataframe created by column-wise merging all the *Train dataframes above
* test - dataframe created by column-wise merging all the *Test dataframes above
* sensors - dataframe created by merging the test and train dataframes row-wise
* summaryData - dataframe containing the tidied and subsetted data for output

##Output 
The output is a 180x68 space-delimited data file named "sensor_avg_by_subject_and_activity.txt", with the first column containing subject identifiers, the second column containing activity names and the remaining columns containing averages for the subsetted attributes, as follows:

* tBodyAcc.mean.X, tBodyAcc.mean.Y and tBodyAcc.mean.Z	- The mean of the acceleration of the body on the X, Y and Z axes in the time domain
* tBodyAcc.std.X,	tBodyAcc.std.Y	and tBodyAcc.std.Z	- The mean of the standard deviation of the body on the X, Y and Z axes in the time domain
* tGravityAcc.mean.X,	tGravityAcc.mean.Y	and tGravityAcc.mean.Z	- The mean of the acceleration of gravity on the X, Y and Z axes in the time domain
* tGravityAcc.std.X,	tGravityAcc.std.Y and	tGravityAcc.std.Z	- The mean of the standard deviation of the acceleration of gravity on the X, Y and Z axes in the time domain
* tBodyAccJerk.mean.X,	tBodyAccJerk.mean.Y and	tBodyAccJerk.mean.Z	- The mean of the jerk of the body on the X, Y and Z axes in the time domain
* tBodyAccJerk.std.X,	tBodyAccJerk.std.Y	and tBodyAccJerk.std.Z	- The mean of the standard deviation of the jerk of the body on the X, Y and Z axes in the time domain
* tBodyGyro.mean.X,	tBodyGyro.mean.Y	and tBodyGyro.mean.Z	- The mean of the gyroscope output on the X, Y and Z axes. 
* tBodyGyro.std.X,	tBodyGyro.std.Y and	tBodyGyro.std.Z	- The mean of the standard deviation of the gyroscope output on the X, Y and Z axes.
* tBodyGyroJerk.mean.X,	tBodyGyroJerk.mean.Y and	tBodyGyroJerk.mean.Z	- The mean of the gyroscope jerk signal on the X, Y and Z axes  in the time domain
* tBodyGyroJerk.std.X,	tBodyGyroJerk.std.Y	and tBodyGyroJerk.std.Z	- The mean of the standard deviation of gyroscope jerk signal on the X, Y and Z axes  in the time domain
* tBodyAccMag.mean and	tBodyAccMag.std	- The mean and mean of standard deviations of the magnitude of body acceleration in the time domain
* tGravityAccMag.mean and	tGravityAccMag.std - The mean and mean of standard deviations of the magnitude of gravity acceleration in the time domain
* tBodyAccJerkMag.mean	and tBodyAccJerkMag.std	- The mean and mean of standard deviations of the jerk magnitude
* tBodyGyroMag.mean	and tBodyGyroMag.std	- The mean and mean of standard deviations of the gyro magnitude
* tBodyGyroJerkMag.mean	and tBodyGyroJerkMag.std	- The mean and mean of standard deviations of the gyro jerk magnitude
* fBodyAcc.mean.X, fBodyAcc.mean.Y	and fBodyAcc.mean.Z	- The mean of body acceleration on the X, Y and Z axes  in the time domain
* fBodyAcc.std.X,	fBodyAcc.std.Y	and fBodyAcc.std.Z	- The mean of standard deviations of body acceleration on the X, Y and Z axes  in the time domain
* fBodyAccJerk.mean.X,	fBodyAccJerk.mean.Y and fBodyAccJerk.mean.Z	- The mean of the jerk of the body on the X, Y and Z axes in the frequency domain
* fBodyAccJerk.std.X,	fBodyAccJerk.std.Y and	fBodyAccJerk.std.Z	- The mean of the standard deviations of the jerk of the body on the X, Y and Z axes in the frequency domain.
* fBodyGyro.mean.X,	fBodyGyro.mean.Y	and fBodyGyro.mean.Z	- The mean of the gyroscope signal on the X, Y and Z axes in the frequency domain
* fBodyGyro.std.X,	fBodyGyro.std.Y	and fBodyGyro.std.Z	- The mean of the standard deviations of the gyroscope signal on the X, Y and Z axes in the frequency domain
* fBodyAccMag.mean and	fBodyAccMag.std	- The mean and mean of standard deviations of the magnitude of the body acceleration in the frequency domain
* fBodyBodyAccJerkMag.mean	amd fBodyBodyAccJerkMag.std	- The mean and mean of standard deviations of the magnitude of the body jerk in the frequency domain
* fBodyBodyGyroMag.mean	and fBodyBodyGyroMag.std	- The mean and mean of standard deviations of gyro measurements in the frequency domain
* fBodyBodyGyroJerkMag.mean	fBodyBodyGyroJerkMag.std - The mean and mean of standard deviations of the magnitude of the gyro jerk in the frequency domain
