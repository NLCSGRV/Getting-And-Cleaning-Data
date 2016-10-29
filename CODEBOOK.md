
Code Book
========
This code book that describes the data and any variables and transformations used to tidy the data and will follow the sequence used in the source code.

Initialisation
--------------
The old working directory into the variable *oldWorkingDir* and sets the working directory to the value in *workingDir*. Change this latter variable to the working directory of your choice. The "plyr" package is loaded (and installed if necessary).


Acquiring and decompressing the raw data
----------------------------------------
We create a subdirectory to hold the downloaded data if this directory does not already exist. We then switch the working directory to that subdirectory and attempt to download the zip file containing the raw data, if that file does not already exist. Finally, we unzip the data file before setting the working directory back to the parent directory.

The dataset provides:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* An activity label.
* An identifier of the subject who carried out the experiment. 

Reading the data
----------------
The working directory is changed to the "UCI HAR Dataset" located inside the subdirectory created in the step above. We then read the test and train data into dataframes as follows:

| Filename            | Dataframe Variable |
|---------------------|--------------------|
| X_test.txt          | xTest              |
| Y_test.txt          | yTest              |
| subject_test.txt    | subjectTest        |
| X_train.txt         | xTrain             |
| Y_train.txt         | yTrain             |
| subject_train.txt   | subjectTrain       |
| activity_labels.txt | activityLabels     |
| feature_labels.txt  | featureLabels      |

Data from the "Inertial Signals" directories is not loaded as it would be discarded in its entirety in later processing.

Merging the data
----------------
We create a train dataset by binding *subjectTrain*, *xTrain* and *yTrain* column-wise. This dataframe is stored in the variable *train*. Then a *test* dataframe is created by binding *subjectTest*, *xTest* and *yTest* column-wise.

We then remove all variables that are no longer required before merging the *train* and *test* dataframes row-wise and storing the result in a new variable *sensors*. Labels for the *sensors* dataframe are set by extracting them from the *featureLabels* dataset.


Tidying the data
----------------
As the "Id" column in the sensors dataframe contains numeric coding for the activities, we first join the *sensors* data to the *activityLabels* data using the "Id" column. Then we create a new column in the *sensors* dataframe and use it to store the matching Activity from the *activityLabels* dataframe.

Once the new "Activity" column is populated, the "Id" column is dropped from the *sensors* dataframe as it is surplus to requirements. We then removes any unused variables from the workspace before subsetting the dataframe to keep only those columns with "mean" or "std" in the name, in addition to the "Subject" and "Activity" columns.

Finally, we tidy the column names by removing brackets and ensure the names are syntactically valid.

Writing summary data
--------------------
We make use of the ddply function from the plyr package to produce a new dataset containing the average the variables in the *sensors* dataframe by subject and activity. This dataframe is then written to the file *sensor_avg_by_subject_and_activity.txt* using the write.table function. This dataset contains:

* An identifier for each test subject. This is in the range 1 to 30.
* A label for each activity, such as WALKING, SITTING, STANDING, etc. 
* 66 additional columns containing means for those columns in the source data that themselves contained mean or standard deviations. These are named according to the convention:
   * measurement_name - the name of the signal or calculated value, such as Acceleration or Gyroscope movements.
   * mean_or_std - whether the column contains the mean or standard deviation of the given measurement

Clearing down
-------------
The last line of the source code set the working directory back to the value stored in the *oldWorkingDir* variable.