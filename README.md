Getting-and-Cleaning-Data-Project
=================================

Getting and Cleaning Data Project
## coursera-get-data-002

# Getting and Cleaning Data Course Project
-----------------------------------------
This repository is output of work I completed for the project for course 'Getting and Cleaning Data Course'
This file explains how to setup and run scripts that will produce outpu

# Data
-----
Please refer to following link for explaination raw data
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#


# Steps for running script
-----------------------

IMP: Project assignment description assumes that dataset is downloaded and unzip and ready for use. However I have provided two scripts as below -
1. run_analysis.R - This assumes you have set up working directory and script will download and unzip file and use it
2. run_analysis_NO_DOWNLOAD.R - this assumes you have data downloaded and unzipped in working directory

# Steps:

1. First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in working directory and unzip downloaded zip - extract all here.
2. This will create folder "UCI HAR Dataset" in working directory with data. 
3. Make sure the folder "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory.
4. use source("run_analysis.R") command in RStudio.
5. you will find two output files are generated in the current working directory:
 - tidydata.csv - comma seprated tidyData output
 - tidydata.txt - Tab seprated tidyData output
6.  open tidyData.csv in Excel to check data or run command  "evalData <- read.csv("tidydata.csv") command in RStudio to read the file. 
7. As per project need only average of each variable for each activity and each subject is extracted in tidyData. There are 6 activities, 30 subjects, totaling 180 rows with all combinations for each of the 79 features.

