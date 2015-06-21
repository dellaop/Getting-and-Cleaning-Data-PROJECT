---
title: "Project Course Coursera: Getting and Cleaning Data"
date: "Sunday, June 21, 2015"
output:
  html_document:
    toc: true
    highlight: haddock
---
<p style="color:blue">=======================================================================</p>  

FILES:    

* this `ReadMe.md` (markdown document)   

* `run_analysis.r` (R script)  

* `codeBook.md` (markdown document)  

* `TidyDat.txt` (tidy data text file)  

Info on the data and processing protocol is given below.  
The `run_analysis.r` contains all the R commands for generating the tidy data.  
The `codeBook.md` file provides a description of the output variables.  
The `TidyDat.txt`  file has the actual processed data.  


FILE:  **_TidyDat.txt_**  
15480 rows and 4 columns  
Column names: IDSubject, Act, feature and mean   

Import into R using:  
read.delim("TidyDat.txt")  


## Original data set  
Original data set collected from the accelerometers from the Samsung Galaxy S smartphone. 

Data: 30 subjects performing activities of daily living (ADL) while WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
# The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

561 variables x 30 subjects x 6 activities.  
Data from:  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Full description in  
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Processed data  
File: TidyDat.txt

1) Test and train data were combined (rbind) into a single object.

2) Original column names were kept with minor editing for better reading. Names are descriptive and clear. They contained a prefix indicating if the variable derived from the time (t) or frequency (f) signal domain. '-XYZ' indicated axial signals in the X, Y and Z directions. Acceleration signal were separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). See `codeBook.r` for further info on other processed variables.  

3) From the original set, only some variables were selected. The selection criterium applied was that the keywords 'mean' or 'std' were contained in the column names, regardless the case. Eighty-six variables were selected.  

4) Activity ID codes were replaced by corresponding descriptive names:
              1 WALKING
              2 WALKING_UPSTAIRS
              3 WALKING_DOWNSTAIRS
              4 SITTING
              5 STANDING
              6 LAYING

5) Finally, a new object was created with the average of each variable for each activity and each subject. It was generated by R function 'aggregate' with wide format  (180 rows x 88 columns) and convert into long format by function 'gather' of the tidyr R package (10299 rows x 564 columns). One or the other format is tidy. The format of choice will depend of the analysis to be done. The long format was the one given in a separate file *TidyDat.txt*.

The output generated is tidy because it meets the criteria:  

* Each variable in a column: IDSubject, Act, feature, mean.  

* Each observation in a row. This case is particular since we are dealing with averages of variables. Moreover the original variables are not all 'per se' necessarily independent or mutually exclusive because they were derived by different protocols from same basic data. In the case of the long format, under the column  named "feature" are listed all the variables. The "observation" here is considered to be average value for a particular variable for each subject performing a given activity.  
  
* This table represents a unique 'observational unit' in the sense given in the previous paragraph.  


# Referencies
Class material  
Coursera forum and coursera thread https://class.coursera.org/getdata-015/forum/thread?thread_id=27  
Wickham, Hadley. Tidy Data. Journal of Statistical Software.  http://www.jstatsoft.org/. Downloaded 10 June 2015.  