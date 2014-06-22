Information on run_analysis.R file created for the Getting and Cleaning Data course on coursera.org
=========================================
Arthur Pignotti
=========================================

Contents of repo
=========================================
run_analysis.R - This does the creation of the tidyData.txt and sumData.txt files
Codebook.md - This explains the variables, process, and data in the repo
tidyData.txt - This file contains the mean and standard deviation measurements for all of the observations in the data
sumData.txt - This file is a synthesis of the tidyData.txt file, containing the averages of the mean and standard deviation measurements by subject and activity


Notes on running the R script
=========================================
The R script includes everything needed to run the analysis on the wearable computing data from downloading the file to outputting the data files. There are no additional R packages or scripts need to run the analysis so just highlight all of the code in RStudio and run it. The only thing required from the user is to set the working directory of where you would like to see the results. If you download the zip file or even unzip it, just make sure the zip file or the unzip folder are in the working directory that you want to use to be any to run the rest of the script.


The purpose of this R script
=========================================
The R script combines all of the test and train data from the experiment into a tidy and a summarized dataset so a user can sort and analysis the data according to test subject and/or activity.


The R script outputs the following files and folders will be in your working directory with a short description in parentheses:
=========================================
tidyData.txt (this file contains the mean and standard deviation measurements for all of the observations in the data)
sumData.txt (this file is a synthesis of the tidyData.txt file, containing the averages of the mean and standard deviation measurements by subject and activity)
Data.zip (the zip containing the raw data)
UCI HAR Dataset (this is the folder containing all of the raw data. If you want more information on its contents, read the README.txt file within the folder)


The process of the R script. Also see comments within the R script for reference
=========================================
Process: The R script first downloads the zip file and unzip the folder containing the raw data. It then loads all of the necessary raw datasets from the zip folder as different tables in R. To make the process easier down the road, the scrip changes all of the labels with meanFreq() to mFreq() to make sorting out the true mean columns easier. The script names all of the columns. The y data refers to the activity so those tables are called Activity and the subject data are called Subject. The x data refers to the actual variable measurements, which corresponds to the features list so the features list is used as the column labels for the x data. Then the corresponding testing and training tables are combined together. From the combined table of testing and training x data, the script creates a new table with just the mean and standard deviation variables, sorting out the rest. Now the resulting tables are brought together in this column order: Subject, Activity and the sorted x data. Using the activity list as an index, the script replaces the representative numbers with descriptions labels. For example, 1 in the Activity column represents Walking so the 1 will be replaced with the character string "Walking". This marks the completion of creating the tidyData table. For creating the summary table, I reused the table before adding the Activity labels so I could use the colMeans function. I created two interacting loops that used the unique subject values and the activities as indices to create subsets that had each variable averaged, creating a row of a subject and activity with the averages of each of the variable columns. The resulting rows are added to a new data table. The resulting table is transformed into a data frame. The scripts replaces the numbers representing the activities with Activity labels like before, completing the sumData table. The sumData and tidyData tables are finally exported as text files to be used later for analysis.


Last modified date
=========================================
The run_analysis.R file was last modified on 6/21/2014


Information on raw data source
=========================================
For more information on the source of the data go to: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original Data Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws