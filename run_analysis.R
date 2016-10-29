workingDir <- "/Volumes/Main/github/Getting-And-Cleaning-Data/"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"


## Initialise
oldWorkingDir <- getwd()
setwd(workingDir) 
if (!require(plyr)) {
   install.packages("plyr")
   library(plyr)
}

## Download and decompress data
dir.create(file.path(getwd(), "Source_Data"), showWarnings = FALSE)
setwd(file.path(getwd(), "Source_Data"))
zipFile <- paste(getwd(),basename(fileURL),sep="/")
if(!file.exists(zipFile)) {
   download.file(fileURL, zipFile)
}
unzip(zipFile)

## Read data
setwd(file.path(getwd(), "UCI HAR Dataset"))
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/Y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/Y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")
activityLabels <- read.table("activity_labels.txt", col.names = c("Id", "Activity"))
featureLabels <- read.table("features.txt", colClasses = c("character"))
setwd(workingDir)

## Merge datasets
## Create train and test datasets by binding column-wise.
train <- cbind(subjectTrain, cbind(xTrain, yTrain))
test <- cbind(subjectTest, cbind(xTest, yTest))
   
## Remove the source datasets from the workspace
rm(list=c("subjectTrain","subjectTest","xTrain","xTest","yTest","yTrain"))
   
## Merge train and test datasets by binding row-wise.
sensors <- rbind(train, test)

## Get the labels for the merged dataset from the featureLabels dataframe.
## Add the label for the Test Subject first and the Test Label last.
sensorLabels <- c("Subject",featureLabels[,2],"Id")
   
## Apply labels to our merged dataset
names(sensors) <- sensorLabels
   
## Remove the train, test and featureLabels datasets and the 
## sensorLabels ojbect from the workspace
rm(list=c("train","test","featureLabels","sensorLabels"))
   
## Tidy the dataset
## Replace the numeric activity code with the descriptive activity
## First join the sensors dataframe to the activityLabel dataframe by Id and 
sensors <- join(sensors,activityLabels,by = "Id", match="first")
   
## Create a new Activity column in sensors equal to the value of the Activity 
## column in activityLabel
sensors[,"Activity"]<-activityLabels[sensors[ ,"Id"], "Activity"]
   
## Drop the Test Id column now that the Activity has been included
sensors <- sensors[, !(names(sensors) %in% c("Id"))]
   
## Remove the activityLabels dataset from the workspace
rm("activityLabels")
   
## Just keep columns with means and standard deviations in addition to Subject and Activity
sensors <- sensors[,grepl("mean\\(\\)|std\\(\\)|Subject|Activity", names(sensors))]
   
## Tidy the column names
names(sensors) <- make.names(gsub("([()])","",names(sensors)))
   
## Write out the tidied data
summaryData <- ddply(sensors, c("Subject","Activity"), numcolwise(mean))
write.table(summaryData, file = "sensor_avg_by_subject_and_activity.txt", row.name=FALSE)

## Set the working directory back to the stored path
setwd(oldWorkingDir)
