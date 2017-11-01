
# Getting and Cleaning Data Course Projectless
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!

# Explanation of run_analysis.r script

The first step is top download the zip file from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip the archive into a folder of your choosing and set that folder as the working directory in R.

After that, you can run "run_analysis.R", details of what the script does, and explanation follows below:

Note that all the read.table functions use all the default settings, as that worked to get the correct data.

First it reads in the activity data
```R
testy <- read.table("test/Y_test.txt")
trainy <- read.table("train/Y_train.txt")
```
Then it reads in the subject data
```R
testsub <- read.table("test/subject_test.txt")
trainsub <- read.table("train/subject_train.txt")
```
After that it reads in the main data sets, which contains all the measurement values.
```R
testx <- read.table("test/X_test.txt")
trainx <- read.table("train/X_train.txt")
```
It then appends all the test and train data together
```R
y <- rbind(testy,trainy)

sub <- rbind(testsub,trainsub)

x <- rbind(testx,trainx)
```
puts descriptive names for the activity and subject data
```R
names(y) <- "label"

names(sub) <- "subject"
```
assigns descriptive names for the measurements by taking the names from the features file, the names are found in the second column, named V2
```R
names(x) <- read.table("features.txt")$V2
```
now it binds all the datasets together by column
```R
yx <- cbind(y,x,sub)
```
it reads in the activity labels
```R
activities <- read.table("activity_labels.txt")
names(activities) <- c("label","activity")
```
and now it pulls in the activity labels into the main dataset
```R
yx <- merge(yx,activities,on="label",all.x=T)
```
it keeps only columns that have a name containing mean(),std(),activity, or subject
```R
df <- yx[,grep("mean\\(\\)|std\\(\\)|activity|subject",names(yx))]
```
finally it creates a tidy data set by aggregating all the mean() and std() values by taking the mean for each value grouped by activity and subject
```R
tidy <- aggregate(df[,1:66],by=df[,67:68],FUN=mean)
```
the tidy.csv was created by the line 
write.csv(tidy,"tidy.csv",row.names=F)
and can be read in to r by the command
read.csv("tidy.csv")
