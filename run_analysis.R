##############################################################
# run_analysis.R
#
# Assignment: Getting and Cleaning Data Course Project
# April 2016
# Tamas Szabo
#
##############################################################
rm(list=ls())

library(dplyr)

# create temporary data directory
if (!file.exists("data")) {
  dir.create("data")
}

# download zip archive
zipFile = "./data/FUCI_HAR.zip"
if (!file.exists("./data/FUCI_HAR.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile=zipFile, method="curl")
}

#extract selected files from zip archive
activityLabelsFile = "UCI HAR Dataset/activity_labels.txt"
featuresFile = "UCI HAR Dataset/features.txt"
subjectTestFile = "UCI HAR Dataset/test/subject_test.txt"
xTestFile = "UCI HAR Dataset/test/X_test.txt"
yTestFile = "UCI HAR Dataset/test/y_test.txt"
subjectTrainFile = "UCI HAR Dataset/train/subject_train.txt"
xTrainFile = "UCI HAR Dataset/train/X_train.txt"
yTrainFile = "UCI HAR Dataset/train/y_train.txt"
files = c(activityLabelsFile, featuresFile,
          subjectTestFile, xTestFile, yTestFile,
          subjectTrainFile, xTrainFile, yTrainFile)
exdir = "./data/"
unzip(zipFile, files = files, overwrite = TRUE, exdir = exdir, unzip = "internal", setTimes = FALSE)

# read the extracted files into variables
activityLabels <- read.table(paste(exdir,activityLabelsFile,sep=""))
features <- read.table(paste(exdir,featuresFile,sep=""))
subjectTest <- read.table(paste(exdir,subjectTestFile,sep=""))
xTest <- read.table(paste(exdir,xTestFile,sep=""))
yTest <- read.table(paste(exdir,yTestFile,sep=""))
subjectTrain <- read.table(paste(exdir,subjectTrainFile,sep=""))
xTrain <- read.table(paste(exdir,xTrainFile,sep=""))
yTrain <- read.table(paste(exdir,yTrainFile,sep=""))

# merge rows from train and test sets
s <- bind_rows(subjectTrain,subjectTest)
y <- bind_rows(yTrain,yTest)
x <- bind_rows(xTrain,xTest)

# merge columns and add column names
data <- bind_cols(s,y,x)
names(data) <- append(c("subject"), append(c("activity"), as.vector(features[,2])))

# create dataset with only the subject, activity and mean/std columns for time series data
data1 <- data[, grep("subject|activity|^t.*mean[(][)]|^t.*std[(][)]", colnames(data))]

# turn activity column into factor with activity labels
data1$activity <- factor(data1$activity)
levels(data1$activity) <- as.vector(activityLabels[,2])

# turn subject column into factors
data1$activity <- factor(data1$activity)

# create another dataset with the column avarages grouped by subject and activity
symbols <- lapply(names(data1[c(1,2)]), as.symbol)
data2 <- data.frame(data1 %>% group_by_(.dots=symbols) %>% summarise_each(funs(mean)))

# rename columns to original name
names(data2) <- names(data1)

# remove all variables but the data frame requested - uncomment to clean
#all <- c(ls(), "all")
#rm(list = all[-which(all %in% c("data2"))])

# save the tidy data in data2 to file
#write.csv(data2, file = "tidy_data.csv")
write.table(data2, row.names = FALSE, file = "tidy_data.csv")

# end.