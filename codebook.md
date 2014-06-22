## Getting and Cleaning Data Course Project CodeBook
--------------------------------------------------------
This is codebook file that describes brief description of raw data , variables and transformations work perfomed by me as per instructions given in project description. Please refer README.MD for how to set up and run script.

## Raw Data
--------------------------------------------------------

Dataset is downladed from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Descripton of raw data can be read at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## Transformation and cleaning Steps performed

The R script 'run_analysis.R' found in working directory after following instructions in README.MD. This scripts does all cleaning and data cleaning described below all files from data set
1. Read all data files extracted from zip downloaded from above
2. Merges the training and the test sets to create one data set
 - Cobine the data tables Subject, Activty and data rows
 - Combine Subject and activity with dataTT columns
 
3. Extracts only the measurements on the mean and standard deviation for each measurement.
 - Extract only measurement on mean and standard deviation
 - This is extracted using pattern matching for->  mean() or std() or mean or std
 
4. Uses descriptive activity names to name the activities in the data set.
- set meaningful names for columns
- Label using descriptive activity names found in activity_labels.txt

5. Appropriately labels the data set with descriptive activity names.
- rename descriptive names for features
- This is done by Cleaning features name in readable format by removing () , - and capitalizing M, S

6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- calculate mean/avarage of all variables for each activity and each subject
- write tidydata.csv and tab delimited file tidydata.txt in working directory as tidayData in two seprate format

## Variable Description
----------------------------------------------------------------
# Activity
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

# Subjects - 1 to 30 subjects who performed above actvities and their reading from accelerometer and gyro are taken

# SD and Mean of features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

# Fetaures in tidyData described above -
1. "Activity"
2. "Subjects"
3. "tBodyAccMeanX"
4. "tBodyAccMeanY" 
5. "tBodyAccMeanZ" 
6. "tBodyAccStdX"
7. "tBodyAccStdY"
8. "tBodyAccStdZ"
9. "tGravityAccMeanX"
10. "tGravityAccMeanY"
11. "tGravityAccMeanZ" 
12. "tGravityAccStdX"
13. "tGravityAccStdY"
14. "tGravityAccStdZ"
15. "tBodyAccJerkMeanX" 
16. "tBodyAccJerkMeanY"
17. "tBodyAccJerkMeanZ"
18. "tBodyAccJerkStdX"
19. "tBodyAccJerkStdY"
20. "tBodyAccJerkStdZ" 
21. "tBodyGyroMeanX"  
22. "tBodyGyroMeanY"
23. "tBodyGyroMeanZ" 
24. "tBodyGyroStdX" 
25. "tBodyGyroStdY"
26. "tBodyGyroStdZ" 
27. "tBodyGyroJerkMeanX" 
28. "tBodyGyroJerkMeanY" 
29. "tBodyGyroJerkMeanZ"
30. "tBodyGyroJerkStdX" 
31. "tBodyGyroJerkStdY"
32. "tBodyGyroJerkStdZ"
33. "tBodyAccMagMean"
34. "tBodyAccMagStd"
35. "tGravityAccMagMean"
36. "tGravityAccMagStd"
37. "tBodyAccJerkMagMean"
38. "tBodyAccJerkMagStd"
39. "tBodyGyroMagMean" 
40. "tBodyGyroMagStd"
41. "tBodyGyroJerkMagMean"
42. "tBodyGyroJerkMagStd"
43. "fBodyAccMeanX"
44. "fBodyAccMeanY"
45. "fBodyAccMeanZ" 
46. "fBodyAccStdX"
47. "fBodyAccStdY"
48. "fBodyAccStdZ"
49. "fBodyAccMeanFreqX"
50. "fBodyAccMeanFreqY"
51. "fBodyAccMeanFreqZ"
52. "fBodyAccJerkMeanX"
53. "fBodyAccJerkMeanY"
54. "fBodyAccJerkMeanZ"
55. "fBodyAccJerkStdX"
56. "fBodyAccJerkStdY"
57. "fBodyAccJerkStdZ" 
58. "fBodyAccJerkMeanFreqX"
59. "fBodyAccJerkMeanFreqY"
60. "fBodyAccJerkMeanFreqZ"
61. "fBodyGyroMeanX"
62. "fBodyGyroMeanY"
63. "fBodyGyroMeanZ"
64. "fBodyGyroStdX"
65. "fBodyGyroStdY"
66. "fBodyGyroStdZ"
67. "fBodyGyroMeanFreqX"
68. "fBodyGyroMeanFreqY"
69. "fBodyGyroMeanFreqZ"
70. "fBodyAccMagMean" 
71. "fBodyAccMagStd"
72. "fBodyAccMagMeanFreq"
73. "fBodyBodyAccJerkMagMean"
74. "fBodyBodyAccJerkMagStd"
75. "fBodyBodyAccJerkMagMeanFreq"
76. "fBodyBodyGyroMagMean"
77. "fBodyBodyGyroMagStd" 
78. "fBodyBodyGyroMagMeanFreq"
79. "fBodyBodyGyroJerkMagMean"
80. "fBodyBodyGyroJerkMagStd"
81. "fBodyBodyGyroJerkMagMeanFreq"



