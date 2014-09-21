Codebook.md
===========

These are the variables/data used in processing:

features:
	contains the 561 measurement statistics names 
	came from the features.txt data

subjectTrain:
	has 21 participants
	each participant's identity corresponds to the observation row in xTrain
	came from subject_train.txt data

xTrain:
	the statistical summary for each observation of the 21 participants in each 561 features
	came from X_train.txt data

yTrain:
	correspond to the activity being done on a particular observation in xTrain
	came form y_Train.txt data

subjectTest:
	has 9 participant
	each participants identity corresponds to the observation row in xTest
	came from subject_Test.txt data

xTest:
	the statistical summary for each observation of the 9 particpants in each 561 features
	came from the X_train.txt data

yTest:
	correspond to the activity being done on a particular observation
	came from the y_test.txt data

harData:
	the merged test and train datasets

meanList:
	variable used to get the column numbers that had the word "mean()"

stdList:
	variable used to get the column numbers that had the word "std()"

meanstdList:
	the combined list of columns with the word "mean()" and "std()"

meanstdharData:
	the dataset that contains only the measurement columns with the word "mean()" and "std()"

tidyharData:
	the final dataset that has the mean for the measurements with the word "mean()" and "std()" per subject per 		activity.

Transformation on the Datasets:
	
1. There was no special transformation done to the data set other than to exclude columns that was not required in the result.
2. Minor transformation was done in renaming the columns to be more informative.
3. The values for the activity column was also change to reflect the actual description of the activity rather than the code of the activity.

