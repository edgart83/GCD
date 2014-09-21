GCD
===

Getting and Cleaning Data

The script assumes that the files have already been downloaded and unzipped.
The working directory of R should be pointing to the directory where "UCI HAR Dataset" is.

The following libraries were loaded in R before the run:
  datasets, graphics, grDevices, methods, stats, utils, plyr, dplyr, reshape2

The relevant data are loaded in separate data frames whose names reflect the title of the original file. Hence training data sets has train appended to its name and subject or X or y prepended. This is the same for the Test data set.

Merging was done in 3 stages. First the Test data frames were merged to "testData" using cBind(). Then the Train data frames were merged to "trainData" also using cbind(). cbind was used because we were merging the columns. The resulting two data frames were then merged using rbind() to "harData". rbind was used because we were merging the rows of the data frames. Perhaps it is important to note that the positioning of the data frame in the cbind command was very important as the column names were very confusing. 

The project was asking to extract mean and std measurements from the data frame but I postponed it as it would be easier to extract those after the columns have been named to the more informative measurement names. As it was the column names were the confusing variety of V1, V2 etc.

For step 3 the activity column were filled with the activity description itself. This was done by using sapply to harData with the switch function that paired and replaced activity# to the real activity description.

For step 4 the renaming of the columns to their more informative description was done by using colnames() function. The vector passed was the "subject_id", "activity" and the second column of the features data frame.

With the proper naming of columns completed it was now easier to do the pruning of the columns so that only those that are either mean and std measurements are left. This was done by gathering the column numbers of those columns that have "mean()" on its name and placed under the vector meanList. The same were done for columns with "std()" in its name and these were placed in the vector stdList. Note that there were other column with mainfreq(). This was not included as I interpreted the instruction  to be asking only for "mean" and not "meanfreq". Note the actual grep argument included the "\\" to account for this. 
The two vectors were then combined and sorted to meanstdList. Sorting was done so that the positioning of the columns will be closer to the other relevant measurement criteria. The meanstdList vector list was used via a c() function as an argument for the columns required for the new data frame. The result is meanstdharData which contains only the relevant measurement columns plus the subject and activity names of course.

Step 5, creating a table with the average of the measurement per activity per subject, was done using the aggregate function. The aggregation grouping argument was prefaced with the name of the column as otherwise the column name will be lost to a generic name with just the column info.




