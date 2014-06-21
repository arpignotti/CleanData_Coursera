## Download and unzip files
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./Data.zip")
unzip("./Data.zip")

## Adding data to R as tables
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Renaming meanFreq
features$V2 <- gsub("meanFreq","mFreq",features$V2)

## Naming columns
colnames(x_test) <- features$V2
colnames(x_train) <- features$V2
colnames(test_subject) <- "Subject"
colnames(train_subject) <- "Subject"
colnames(y_test) <- "Activity"
colnames(y_train) <- "Activity"

## Merging test & train tables
xCom <- rbind(x_test,x_train)
yCom <- rbind(y_test,y_train)
subCom <- rbind(test_subject,train_subject)

## Sorting out mean & std columns
xMS <- xCom[,grep("std()|mean()",colnames(xCom))]

## Merging tables together
tidyData <- cbind(subCom,yCom,xMS)

## Using the activity list as an index to replace representative numbers with descriptions
actLen <- nrow(activity)
for (i in 1:actLen) {
    tidyData$Activity[tidyData$Activity == i] = as.character(activity[i,2]) 
}

## Creating the Summary Table by subsetting the subjects and activities and getting the means of the variables
## Note: I reused the table without Activity labels so I could use the colMeans function
newData <- cbind(subCom,yCom,xMS)
sumData = NULL
subLen <- nrow(unique(subCom))
actLen <- nrow(activity)
for (i in 1:subLen) {
    tempSub <- i
    for (n in 1:actLen) {
        tempAct <- n
        tempRow <- colMeans(newData[(newData$Activity == tempAct & newData$Subject == tempSub),])
        sumData <- rbind(sumData, tempRow)
    }
}
## Transforms the output into a dataframe
sumData = data.frame(sumData)
## Reinserts the activity labels
for (i in 1:actLen) {
    sumData$Activity[sumData$Activity == i] = as.character(activity[i,2]) 
}
write.table(tidyData, file = "./tidyData.txt")
write.table(sumData, file = "./sumData.txt")