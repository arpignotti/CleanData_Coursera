Codebook for run_analysis.R, raw data, and outputs
========================================================

Variables holding tables created in R script
=================
activity = This data table is the import of the activity_labels.txt file in the UCI HAR Dataset folder. It contains an index between the number representing the activity in the y dataset and the descriptive label. For example, 1 = "WALKING", 2 = "WALKING_UPSTAIRS", etc.

features = This data table is the import of the features.txt file in the UCI HAR Dataset folder. It contains an index between the column number in the X dataset and the description of the variable.

y_test = This data table is the import of the y_test.txt file in the UCI HAR Dataset/test folder. It contains a table listing the representative numbers of the activities that the testing subjects were participating in and the file corresponds with the X_test.txt file in the same folder along the y-axis.

y_train = This data table is the import of the y_train.txt file in the UCI HAR Dataset/train folder. It contains a table listing the representative numbers of the activities that the training subjects were participating in and the file corresponds with the X_train.txt file in the same folder along the y-axis. 

x_test = This data table is the import of the X_test.txt file in the UCI HAR Dataset/test folder. It contains a table of all of the measurements gathered in the testing session. Therefore the data moving along the x-axis corresponds to the features list in the root directory and the data along the y-axis corresponds with the activity i.e. y_test.txt file and the subject_test.txt file, which are in the same test folder.

x_train = This data table is the import of the X_train.txt file in the UCI HAR Dataset/train folder. It contains a table of all of the measurements gathered in the training session. Therefore the data moving along the x-axis corresponds to the features list in the root directory and the data along the y-axis corresponds with the activity i.e. y_train.txt file and the subject_train.txt file, which are in the same train folder.

test_subject = This data table is the import of the subject_test.txt file in the UCI HAR Dataset/test folder. It contains a table listing of the testing subjects' numbers who were participating in the experiment and the file corresponds with the X_test.txt file in the same folder along the y-axis.

train_subject = This data table is the import of the subject_train.txt file in the UCI HAR Dataset/train folder. It contains a table listing of the training subjects' numbers who were participating in the experiment and the file corresponds with the X_train.txt file in the same folder along the y-axis.

yCom = This data table is the combination of the y_test and y_train data tables, adding the tables together along the y-axis with y_test first and y_train second.

xCom = This data table is the combination of the x_test and x_train data tables, adding the tables together along the y-axis with x_test first and x_train second.

subCom = This data table is the combination of the test_subject and train_subject data tables, adding the tables together along the y-axis with test_subject first and train_subject second.

xMS = After the second column of the features data table is added to the xCom data table as column names and the changing of the names of the columns that have meanFreq() in the names, xMS is the subject of the xCom data table only taking column with mean and std in the names.

tidyData = This data table is the result of combining subCom, yCom, and xMS along the x-axis in that order so the first column is the subject, next is the activity, and after that are the mean and std measurement variables. In this table, the script also uses the activity data table as index to replace the representative numbers in the second column with descriptive activity labels.

newData = This data table is the recreation of the tidyData data table before the descriptive activity label were applied to make it easier to create the sumData data table.

sumData = This data table is constructed from the tidyData data table. The measurement variables are averaged by subject and activity, meaning that it has rows that contain average for each variable in the measurement data for each subject and each activity. For example, the row with Subject 1 and Activity WALKING has the averages of the different variables from a subset of all of the observation that included Subject 1 and Activity WALKING.


Variables for loops created in R script
=================
actLen = the number of rows in the table of Activity labels. It was used to the delimit the length of a for loop that used the elements of the activity table as a criterion to subset the tidyData table.

subLen = the number of UNIQUE rows in the table of subjects. It was used to the delimit the length of a for loop that used the elements of the subject table as a criterion to subset the tidyData table.

tempAct = This is temporary reference number of a for loop that used this variable referenced from the activity table as a criterion to subset the tidyData table by activity.

tempSub = This is temporary reference number of a for loop that used this variable referenced from the subCom table as a criterion to subset the tidyData table by subject.

tempRow = This is temporary row created by using the colMeans function on each subset created with tempAct and tempSub. After each time the row is created, it is added to the sumData data table, which is nulled out at the begining of the process.


Explanation of files enclosed in the zip folder 
=================
activity_labels.txt
features.txt
features_info.txt
Readme.txt
test folder
    subject_test.txt
    X_test.txt
    y_test.txt
    Inertial Signals folder (unused raw raw data)
train folder
    subject_train.txt
    X_train.txt
    y_train.txt
    Inertial Signals folder (unused raw raw data)


Variable measurements in the x data (No explicit units were included in the source documentation so below is copied information from the features_info.txt file so someone smarter than I can make heads or tails of the units for each variable)
=================
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

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


The process of the R script. Also see comments within the R script for reference
=========================================
The R script first downloads the zip file and unzip the folder containing the raw data. It then loads all of the necessary raw datasets from the zip folder as different tables in R. To make the process easier down the road, the scrip changes all of the labels with meanFreq() to mFreq() to make sorting out the true mean columns easier. The script names all of the columns. The y data refers to the activity so those tables are called Activity and the subject data are called Subject. The x data refers to the actual variable measurements, which corresponds to the features list so the features list is used as the column labels for the x data. Then the corresponding testing and training tables are combined together. From the combined table of testing and training x data, the script creates a new table with just the mean and standard deviation variables, sorting out the rest. Now the resulting tables are brought together in this column order: Subject, Activity and the sorted x data. Using the activity list as an index, the script replaces the representative numbers with descriptions labels. For example, 1 in the Activity column represents Walking so the 1 will be replaced with the character string "Walking". This marks the completion of creating the tidyData table. For creating the summary table, I reused the table before adding the Activity labels so I could use the colMeans function. I created two interacting loops that used the unique subject values and the activities as indices to create subsets that had each variable averaged, creating a row of a subject and activity with the averages of each of the variable columns. The resulting rows are added to a new data table. The resulting table is transformed into a data frame. The scripts replaces the numbers representing the activities with Activity labels like before, completing the sumData table. The sumData and tidyData tables are finally exported as text files to be used later for analysis.


Information on raw data source
=========================================
For more information on the source of the data go to: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original Data Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws
