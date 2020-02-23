\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Modified Dataset of Human Activity Recorded by Smartphones

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Paul Brown.
For Coursera Course (Getting and CLeaning Data)

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

The original dataset was derived from the following website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It was modified by the following procedures:

01. Downloaded zip folder from url and unziped folder using download.file() and unzip() commands

02. Explored files in unzipped folder ("UCI HAR Dataset"), as well as the "train" and "test" subfolders, using the list.files() command
	the "UCI HAR Dataset" folder contains the files "activity_labels.txt", "features.txt", "features_info.txt" and "README.txt" 
	the "train" subfolder" contains the files "subject_test.txt", "X_train.txt" and "y_train.txt"
	the "test" subfolder" contains the files "subject_test.txt", "X_test.txt" and "y_test.txt"
	
	the X_train and X_test data contain the results of the variables

03. Read X_train.txt, X_test.txt and features.txt data into R and assigned to variable "train", "test" and "feature", using the read.table() command
	the dimensions are 7352 x 561, 2947 x 561 and 2 x 561 respectively
	these files were further explored with the head() command to confirm shared set of 561 variables

04. Read subject and activity data from train data (subject_train.txt and y_train.txt) into R (n = 7352) using the read.table() command, and prepend 
	to train data with cbind() command

05. Read subject and activity data from test data (subject_test.txt and y_test.txt) into R (n = 2947) using the read.table() command, and prepend to 
	test data with cbind() command

06. Re-labeled variables in train and test datasets starting with "Subject" and "Activity" , and proceding with the feature list in features.txt file 
	(column 2)

07. Combined train and test datasets and assign to variable "traintest", using the rbind() command

08. Created frequency table of column names and identified if duplicate column names present

09. Removed columns with duplicate column names (none of the duplicate column names include "mean" or "std", which we are targeting)
	this step also ensures one variable for each column (a requirement of tidy data)

10.	Examined list of column names with colnames() command, and selected Subject and Activity variables as well as variables involving the mean and 
	standard deviation for each measurement with the select() command
	this step excluded angle variables, which are not actual mean values

11. Added descriptive activity names to name the activities in the data set, using information in activity_labels.txt file

12. Labeled the data set with descriptive variable names by replacing "tBody", "tGravity", "f", "()" and "BodyBody" with "Time-Body", "Time-Gravity", "Freq-", 
	"" and "Body" respectively

13. Wrote data to file named "Project-Dataset1.csv" with one variable per column and one observation per row (requirements of tidy data)

14. Created a second, independent tidy data set with the average of each variable for each activity and each subject using the split() and then sapply(colMeans()) commands

15. Transposed resulting dataframe to place variables as columns and subjects / activities as rows with the t(as.matrix()) commands

16. Wrote data to file named "Project-Dataset2.csv" with one variable per column and one observation (subject number.activity) per row (requirements of tidy data)

17. Wrote data to file named "Project-Dataset3.txt" with one variable per column and one observation (subject number.activity) per row (requirements of tidy data)

Please consult the accompanyng Code Book for a description of all variables included.


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Reference
This dataset is a derivative of the data reported in the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012


