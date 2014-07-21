## Brenda Chodkowski
## Getting and Cleaning Data
## Class project

## the subjects for the training data
subject_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")
## name the column "subject"
colnames(subject_train) <- c("subject")

## the activities for the training data
y_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
## name the column "activity"
colnames(y_train) <- c("activity")

## the actual data for the activites for training
x_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
## the variables names read in for training and test data
features <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt")
## name the columns of the training data
colnames(x_train) <- features[,"V2"]

## combin the subjects, activities, and feature data
total_train <- cbind(subject_train, y_train)
total_train <- cbind(total_train, x_train)

## we don't need these according to the FAQ
##total_acc_z_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt")
##total_acc_y_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt")
##total_acc_x_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_x_train.txt")

## we don't need these according to the FAQ
##body_gyro_z_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt")
##body_gyro_y_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt")
##body_gyro_x_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_x_train.txt")

## we don't need these according to the FAQ
##body_acc_z_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt")
##body_acc_y_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt")
##body_acc_x_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_x_train.txt")

## the subjects for the test data
subject_test <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")
## name the column "subjects"
colnames(subject_test) <- c("subject")

## the activity data for the test data
y_test <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
## name the column "activity"
colnames(y_test) <- c("activity")

## the actual data for testing
x_test <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
## rename the columns of the testing data
colnames(x_test) <- features[,"V2"]

## combine the subjects, activities, and the feature data for the test data
total_test <- cbind(subject_test, y_test)
total_test <- cbind(total_test, x_test)

## combin the test data and training data to make one tidy data set
total <- rbind(total_train, total_test)

##colnames(total)
## Returns the column number with the word "mean" in it
grep("[Mm][Ee][Aa][Nn]", colnames(total))
## means columns
meansColumns <- grep("[Mm][Ee][Aa][Nn][(]", colnames(total), value=TRUE)
## std columns
stdColumns <- grep("[Ss][Tt][Dd]", colnames(total), value=TRUE)
## all the columns we want
columnsToKeep <- c("subject", "activity", meansColumns, stdColumns)
## we only want certain columns
total <- total[,columnsToKeep]

## read in the activities
activities <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt")

## merge on activity id
total = merge(total, activities, by.x="activity", by.y="V1", all=TRUE)
## we no longer need the activity id
total = total[,2:69]

## we need to rename the activity column
names <- colnames(total[1:67])
names <- c(names, "activity")
colnames(total) <- names

library(plyr)
tidy <- ddply(total, c("subject","activity"), numcolwise(mean))

##write.table(tidy,"tidyData.txt", sep="\t")
##testTidy <- read.table("tidyData.txt", sep="\t")
