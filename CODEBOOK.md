
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
* activityLabeks - dataframe created from activity_labels.txt
* featureLabels - dataframe created from feature_labels.txt
* train - dataframe created by column-wise merging all the *Train dataframes above
* test - dataframe created by column-wise merging all the *Test dataframes above
* sensors - dataframe created by merging the test and train dataframes row-wise
* summaryData - dataframe containing the tidied and subsetted data for output

##Output 
The output is a 180x68 data file named "sensordata_avg_by_subject_and_activity.txt", with the first column containing subject identifiers, the second column containing activity names and the remaining columns containing averages for the subsetted attributes.