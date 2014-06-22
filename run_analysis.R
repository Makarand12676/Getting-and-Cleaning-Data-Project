# run_analysis.R


# Instructions for project
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.
# You will be required to submit: 
# 1) a tidy data set as described below,
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up
# the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
# This repo explains how all of the scripts work and how they are connected.  

# One of the most exciting areas in all of data science right now is wearable computing - 
# see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms 
# to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
        
#        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Here are the data for the project: 
        
# DATA URL ->>>        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 






# 
# You should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set. - Completed
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. - Completed
# 3. Uses descriptive activity names to name the activities in the data set. - Completed
# 4. Appropriately labels the data set with descriptive activity names. - Completed
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. - Completed 
# 
#




# Set up
# ------------------------------------------------------------------------------------------------------

# Load following packages - 


packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# Set path to Directory where data is located
# IMP - Assignment assumes that data files are already downloaded and ready to use. For evaluation make sure you have files downloaded to working directory
# 
# Download data from DATA URL above in YOUR WORKING DIRECTORY (line # 23) and un zip. Un zip will create following folder structure.
# get path to above folder assuming it is working dir
path <- getwd()


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"

download.file(url,file.path(path,f))
unzip(file.path(path,f),exdir=getwd())


dataPath <- file.path(path,"UCI HAR Dataset")



# Check if workind directory is correct and should look like exactly below

list.files(path, recursive = TRUE)

#########
#[1] "getdata-projectfiles-UCI HAR Dataset.zip"       <--- This may not present bu all files should be present in correct location             
#[2] "run_analysis.R"                                              
#[3] "UCI HAR Dataset/activity_labels.txt"                         
#[4] "UCI HAR Dataset/features.txt"                                
#[5] "UCI HAR Dataset/features_info.txt"                           
#[6] "UCI HAR Dataset/README.txt"                                  
#[7] "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"   
#[8] "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"   
#[9] "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"   
#[10] "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"  
#[11] "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"  
#[12] "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"  
#[13] "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"  
#[14] "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"  
#[15] "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"  
#[16] "UCI HAR Dataset/test/subject_test.txt"                       
#[17] "UCI HAR Dataset/test/X_test.txt"                             
#[18] "UCI HAR Dataset/test/y_test.txt"                             
#[19] "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt" 
#[20] "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt" 
#[21] "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt" 
#[22] "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
#[23] "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
#[24] "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
#[25] "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
#[26] "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
#[27] "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
#[28] "UCI HAR Dataset/train/subject_train.txt"                     
#[29] "UCI HAR Dataset/train/X_train.txt"                           
#[30] "UCI HAR Dataset/train/y_train.txt"   


#########

# The files in the `Inertial Signals` folders are not used as per assignement instructions

####################################################################################################
# Read the files
####################################################################################################

# Read the subject files files

dt_Subject_Train <- data.table(read.table(file.path(dataPath, "train", "subject_train.txt")))
dt_Subject_Test  <- data.table(read.table(file.path(dataPath, "test", "subject_test.txt")))

# Read Actvity files i.e label files as per data description given in README.txt

dt_Activity_Train <- data.table(read.table(file.path(dataPath, "train", "Y_train.txt")))
        
dt_Activity_Test  <- data.table(read.table(file.path(dataPath, "test", "Y_test.txt")))
       

# Read the data files for training and test. 

dt_Train <- data.table(read.table(file.path(dataPath, "train", "x_train.txt")))
        
dt_Test  <- data.table(read.table(file.path(dataPath, "test", "x_test.txt")))

# Read features from features.txt
dt_Features <- data.table(read.table(file.path(dataPath,"features.txt")))
        
# Read Activty Names
dt_Activity_Names <- data.table(read.table(file.path(dataPath,"activity_labels.txt")))
        

       
######################################################################################################
# TASK 1. Merges the training and the test sets to create one data set.
######################################################################################################

# Cobine the data tables Subject, Activty and data rows

dt_Subject <- rbind(dt_Subject_Train, dt_Subject_Test)
setnames(dt_Subject, "V1", "subject")
dt_Activity <- rbind(dt_Activity_Train, dt_Activity_Test)
setnames(dt_Activity, "V1", "activityNum")
dataTT <- rbind(dt_Train, dt_Test)


# Combine Subject and activity with dataTT columns.

dt_Subject <- cbind(dt_Subject, dt_Activity)
dataTT <- cbind(dt_Subject, dataTT)

# Set key Subject and activityNum

setkey(dataTT, subject, activityNum)

#########################################################################################################
# TASK 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#########################################################################################################

# `features.txt` file in dt_Features describes which variables in `dataTT` are measurements for the mean and standard deviation.
# Rename dt_Featurs with meaningful names

setnames(dt_Features, names(dt_Features), c("featureNum", "featureName"))

# Extract only measurement on mean and standard deviation
# this is extracted using pattern matching for->  mean() or std() or mean or std


dt_Features <- dt_Features[grepl("mean\\(\\)|std\\(\\)|mean|std", featureName)]


# Identify columns in dataTT that corrosponds to dt_Features
# column names are in format v#

dt_Features$featureCol2extract <- dt_Features[, paste0("V", featureNum)]


# Extract these columns and subject and activityNum to create required data table

cols <- c(key(dataTT), dt_Features$featureCol2extract)
dataTT <- dataTT[, cols, with=FALSE]
#########################################################################################################
# TASK 3. Uses descriptive activity names to name the activities in the data set.
#########################################################################################################


#`activity_labels.txt` file read in to dt_Activity_Names loaded above in read file section will be used to identify descriptive names for the activities.
# set meaningful names for columns

setnames(dt_Activity_Names, names(dt_Activity_Names), c("activityNum", "activityName"))


# Label using descriptive activity names in dataTT


dataTT <- merge(dataTT, dt_Activity_Names, by="activityNum", all.x=TRUE)
# redfine the key by adding activityName 

setkey(dataTT, subject, activityNum, activityName)
###########################################################################################################
# TASK 4. Appropriately labels the data set with descriptive activity names.
##########################################################################################################


# rename descriptive names for features
tes <- names(dataTT)%in% dt_Features$featureCol2extract
colnames <- names(dataTT)
ct <- colnames[tes]
# Clean features name in readable format by removing () , - and capitalizing M, S. 
dt_Features$featureName <- gsub("\\(\\)", "", dt_Features$featureName) 
dt_Features$featureName <- gsub("mean", "Mean", dt_Features$featureName)
dt_Features$featureName <- gsub("std", "Std", dt_Features$featureName) 
dt_Features$featureName <- gsub("-", "", dt_Features$featureName) 

newct <- dt_Features$featureName
newct <- as.character(newct)
setnames(dataTT,ct,newct)



############################################################################################################
# TASK 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
############################################################################################################

# calculate mean/avarage of all variables for each activity and each subject


dataTTDF <- as.data.frame(dataTT)
tidyData <-aggregate(dataTTDF[,4:ncol(dataTT)-1], by=list(Activity = dataTT$activityName, Subjects = dataTT$subject), FUN=mean,  na.rm=TRUE)

##############################################################################################################
# Save tidyData file in comma seperated fomat.
##############################################################################################################
# ON some OS (win) there is limit to # of charecters/line and hence open the data in editors like textpad or use CSV file below
# Generating two identical tidyData file. one in CSV format and other in tab delimeted

# Generate CSV tidyData file- check this file for better readbility by opening in Excel
write.table(tidyData, file="./tidydata.csv", sep=",",row.names=FALSE)

# Generate Tab dlimited file
write.table(tidyData, file="./tidydata.txt", sep="\t",row.names=FALSE)





