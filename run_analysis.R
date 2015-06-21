# Project Course Coursera: Getting and Cleaning Data
# 10 June 2015

# Data: 30 subjects performing activities of daily living (ADL) while WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
# The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

# 561 variables x 30 subjects x 6 activities 

# Edit the working directory that is right for you
setwd("D:/Coursera/3-Getting and Cleaning Data/Project")

Set the working directory where you

# 1) ------
# Merge the training and the test sets to create one data set.
# ***************************************************************************

# Test data
#***********
# Importing data 
ifile0 <- "UCI HAR Dataset/features.txt"        # feature name file
ifile1 <- "UCI HAR Dataset/test/subject_test.txt" # ID subject file
ifile2 <- "UCI HAR Dataset/test/y_test.txt"       # ID activity file
ifile3 <- "UCI HAR Dataset/test/X_test.txt"       # feature measures file
featNames <- read.table(ifile0, 
                  as.is=TRUE)[,-1]    # 561 x 1
testS <- read.table(ifile1)           # 2947 x 1, subjects
testY <- read.table(ifile2)           # 2947 x 1, activities??
testX <- read.table(ifile3)           # 2947 x 561
names(testX) <- featNames

# Creating data.frame
testDat <- data.frame(ID=testS, set="test", ActID=testY, testX  )
dim(testDat) # 2947 x 564
head(testDat)


# Train data
#************
# Importing data
ifile0 <- "UCI HAR Dataset/features.txt"            # feature name file
ifile1 <- "UCI HAR Dataset/train/subject_train.txt" # ID subject file
ifile2 <- "UCI HAR Dataset/train/y_train.txt"       # ID activities file
ifile3 <- "UCI HAR Dataset/train/X_train.txt"       # Features measures file
featNames<- read.table(ifile0, 
                       as.is=TRUE)[,-1]    # 561 x 1
trainS <- read.table(ifile1)           # 7352 x 1
trainY <- read.table(ifile2)           # 7352 x 1
trainX <- read.table(ifile3)           # 7352 x 561
names(trainX) <- featNames

# Creating data.frame
trainDat <- data.frame(ID=trainS, set="train", ActID=trainY, trainX  )
dim(trainDat)  #7352 x 564
head(trainDat)


#  Combining test and train data
# *******************************
Dat <- rbind(testDat, trainDat)
dim(Dat)  # 10299 x 564
names(Dat)[4:564] <- featNames 
names(Dat)[1:3] <- c("IDSubject", "set", "IDAct")
head(Dat[,1:4])


# 2) ------
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# ***************************************************************************

# Selecting variables that contains the words 'mean' or 'std' in its names regardless case but keeping the first 3 columns: "IDSubject", "set", "IDAct"
idx1 <- grep("mean",names(Dat), ignore.case=TRUE)
idx2 <- grep("std",names(Dat), ignore.case=TRUE)
idx <- c(1:3, sort(unique(c(idx1, idx2))))
names(Dat)[idx]
Dat2 <- Dat[,idx]
ncol(Dat2) #  89
head(Dat2)


# 3) ------
# Use of descriptive activity names to name the activities in the data set
# ***************************************************************************

# Creating a dummy vector first
Act <- rep('AAA', nrow(Dat2))
# Checking the activity IDs
sort(unique(Dat2$IDAct))
# Assigning descriptive activity names
Act <- ifelse(Dat2$IDAct == 1, "WALKING", ifelse(Dat2$IDAct == 2, "WALKING_UPSTAIRS", ifelse(Dat2$IDAct == 3, "WALKING_DOWNSTAIRS", ifelse(Dat2$IDAct == 4, "SITTING", ifelse(Dat2$IDAct == 5, "STANDING", ifelse(Dat2$IDAct == 6, "LAYING", "XXX"))))))
# Replacing column with activity numeric IDs by descriptive activity names
idx <- which("IDAct" == names(Dat2))
Dat2[, idx]  <- Act
names(Dat2)[idx] <- "Act"
# Checking
sort(unique(Dat2$Act))


# 4) ------
# Appropriately labels the data set with descriptive variable names. 
# ***************************************************************************
# Columns already have names, given in previous steps. Next, let's make labels easier to read.
names(Dat2) <- gsub("()", '',names(Dat2), ignore.case=TRUE, fixed=TRUE)
names(Dat2) <- gsub("BodyBody", 'Body',names(Dat2), ignore.case=TRUE, fixed=TRUE)
names(Dat2) <- gsub("(", '-',names(Dat2), ignore.case=TRUE, fixed=TRUE)
names(Dat2) <- gsub(")", '',names(Dat2), ignore.case=TRUE, fixed=TRUE)
names(Dat2)


# 5) ------
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# ***************************************************************************
head(Dat2)[,1:5]
names(Dat2)[1:15]

wideFormat <- aggregate(Dat2[,-(1:3)], list(IDSubject=Dat2$IDSubject, Act=Dat2$Act), mean, na.rm=TRUE)
dim(wideFormat)  # 180 x88
head(wideFormat)[,1:4]

library(tidyr)
longFormat <- gather(wideFormat, feature, mean, -(1:2)) 
dim(longFormat) # 15480 x 4
head(longFormat)

write.table(longFormat, "TidyDat.txt", quote=FALSE, row.names=FALSE, sep = "\t")
