#This assumes that the zip file has been downloaded, unzipped, R working directory points to the "UCI HAR Dataset"
#load the files in to a data frame

#Library loaded are datsets, graphics, grDevices, methods, stats, utils, plyr, dplyr, reshape2

#step 1 merge the datasets
#load the datasets 
features <- read.table("features.txt")
setwd("test")
subjectTest <- read.table("subject_test.txt")
xTest <- read.table("X_test.txt")
yTest <- read.table("y_test.txt")
setwd("../train")
subjectTrain <- read.table("subject_train.txt")
xTrain <- read.table("X_train.txt")
yTrain <- read.table("y_train.txt")

#merge the three Test data
testData <- cbind(subjectTest, yTest, xTest)
#merge the three Train data
trainData <- cbind(subjectTrain, yTrain, xTrain)
#merge the test and train data
harData <- rbind(trainData, testData)

#Rather than do step 2 we do step 3 and 4 first as this makes it easier to manipulate the dataset
#this is due to the problem with non distinct column names 

#step3 name the activity colum to the activity description
harData[,2] <- sapply(harData[,2], switch, "1" = 'WALKING', "2" = 'WALKING_UPSTAIRS', "3" = 'WALKING_DOWNSTAIRS', "4" = 'SITTING', "5" = 'STANDING', "6" = 'LAYING') 

#step4 apply descriptive labels on the dataset
colnames(harData) <- c("subject_id", "activity", c(as.character(features$V2)))

#step2  extract only the mean and std  measurements
meanList <- grep("mean\\()", names(harData))  	#get the column number whose name has "mean()"
stdList <- grep("std\\()", names(harData))
meanStdList <- sort(c(c(meanList, c(stdList))))		#sort the numbers as they are closely related
meanstdharData <- harData[, c(1,2,c(meanStdList))]		#the subject and activity column was added

#step5  creating a table with the average of the measurements per activity per subject
tidyharData <- aggregate(meanstdharData[,3:68], list("subject#"=meanstdharData[,1], "activity"=meanstdharData[,2]), mean)

