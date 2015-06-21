---
title: "Project Course Coursera: Getting and Cleaning Data"
date: "Sunday, June 21, 2015"
output:
  html_document:
    toc: true
    highlight: haddock
---
<p style="color:blue">=======================================================================</p>  

FILE:  TidyDat.txt  
    15480 rows by 4 columns  
    Column names: IDSubject, Act, feature and mean  
# --------------------------------------------------------------------

**IDSubject:**  
  Identity of the subject. 30 individuals were involved in the experiment.  
  1-30  


**Act:**  
  WALKING  
  WALKING_UPSTAIRS  
  WALKING_DOWNSTAIRS  
  SITTING  
  STANDING  
  LAYING  


**feature:**  
  86  variables

  Measures form accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Filtered and normalized data. 
  
  Prefix 't' denotes time domain signals  
  Prefix 'f' denotes frequency domain signals  
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions  

  Acceleration signal were separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).  

  The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).  

  The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   

  A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.  
  
  Variables estimated from signals:   
      mean: Mean value  
      std: Standard deviation  
      angle: Angle between to vectors.  

  LIST OF VARIABLES: 
  tBodyAcc-mean-X  
  tBodyAcc-mean-Y  
  tBodyAcc-mean-Z  
  tBodyAcc-std-X  
  tBodyAcc-std-Y  
  tBodyAcc-std-Z  
  tGravityAcc-mean-X  
  tGravityAcc-mean-Y  
  tGravityAcc-mean-Z  
  tGravityAcc-std-X  
  tGravityAcc-std-Y  
  tGravityAcc-std-Z  
  tBodyAccJerk-mean-X  
  tBodyAccJerk-mean-Y  
  tBodyAccJerk-mean-Z  
  tBodyAccJerk-std-X  
  tBodyAccJerk-std-Y  
  tBodyAccJerk-std-Z  
  tBodyGyro-mean-X  
  tBodyGyro-mean-Y  
  tBodyGyro-mean-Z  
  tBodyGyro-std-X  
  tBodyGyro-std-Y  
  tBodyGyro-std-Z  
  tBodyGyroJerk-mean-X  
  tBodyGyroJerk-mean-Y  
  tBodyGyroJerk-mean-Z  
  tBodyGyroJerk-std-X  
  tBodyGyroJerk-std-Y  
  tBodyGyroJerk-std-Z  
  tBodyAccMag-mean  
  tBodyAccMag-std  
  tGravityAccMag-mean  
  tGravityAccMag-std  
  tBodyAccJerkMag-mean  
  tBodyAccJerkMag-std  
  tBodyGyroMag-mean  
  tBodyGyroMag-std  
  tBodyGyroJerkMag-mean  
  tBodyGyroJerkMag-std  
  fBodyAcc-mean-X  
  fBodyAcc-mean-Y  
  fBodyAcc-mean-Z  
  fBodyAcc-std-X  
  fBodyAcc-std-Y  
  fBodyAcc-std-Z  
  fBodyAcc-meanFreq-X  
  fBodyAcc-meanFreq-Y  
  fBodyAcc-meanFreq-Z  
  fBodyAccJerk-mean-X  
  fBodyAccJerk-mean-Y  
  fBodyAccJerk-mean-Z  
  fBodyAccJerk-std-X  
  fBodyAccJerk-std-Y  
  fBodyAccJerk-std-Z  
  fBodyAccJerk-meanFreq-X  
  fBodyAccJerk-meanFreq-Y  
  fBodyAccJerk-meanFreq-Z  
  fBodyGyro-mean-X  
  fBodyGyro-mean-Y  
  fBodyGyro-mean-Z  
  fBodyGyro-std-X  
  fBodyGyro-std-Y  
  fBodyGyro-std-Z  
  fBodyGyro-meanFreq-X  
  fBodyGyro-meanFreq-Y  
  fBodyGyro-meanFreq-Z  
  fBodyAccMag-mean  
  fBodyAccMag-std  
  fBodyAccMag-meanFreq  
  fBodyAccJerkMag-mean  
  fBodyAccJerkMag-std  
  fBodyAccJerkMag-meanFreq  
  fBodyGyroMag-mean  
  fBodyGyroMag-std  
  fBodyGyroMag-meanFreq  
  fBodyGyroJerkMag-mean  
  fBodyGyroJerkMag-std  
  fBodyGyroJerkMag-meanFreq  
  angle-tBodyAccMean,gravity  
  angle-tBodyAccJerkMean,gravityMean  
  angle-tBodyGyroMean,gravityMean  
  angle-tBodyGyroJerkMean,gravityMean  
  angle-X,gravityMean  
  angle-Y,gravityMean  
  angleangle-Y,gravityMean  
  angle-Z,gravityMean  
  

**mean:**  
  average of each variable by IDSubject and Activity  


