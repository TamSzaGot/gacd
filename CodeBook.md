---
title: "CodeBook"
author: "Tamas Szabo"
date: '2016-04-03'
output: html_document
---

This file describes the features in the data file [tidy\_data.csv](tidy\_data.csv).

The first row in the tidy\_data.csv are the column names for the resulting data table. The names are equvivalent to the feature names in the features.txt file in the original zip file, except the first two columns where the subject and activity features are being stored.
The 40 features extracted from the original data were selected by matching the feature names starting with the charachter 't' and containing the string "mean()" or "std()".
Even though the features in the aggregated data resulting in tidy\_data.csv are the aggregated mean values of the "mean" and "standard deviation" features, calculated per combinations of subject and activity, I retained the original names.

Since a mean calculation do not change the unit of the original features, the same unit as in the original data apply.

The original data were quite tidy already without any NA values and all the values were floating point numbers, so no special tidying of the data were requiered.

As can be seen in the first row of the tiny\_data.csv file, the names of the features in the file are as follows (aside from subject and activity):

| Feature |
|---------|
| tBodyAcc-mean()-X |
| tBodyAcc-mean()-Y |
| tBodyAcc-mean()-Z |
| tBodyAcc-std()-X |
| tBodyAcc-std()-Y |
| tBodyAcc-std()-Z |
| tGravityAcc-mean()-X |
| tGravityAcc-mean()-Y |
| tGravityAcc-mean()-Z |
| tGravityAcc-std()-X |
| tGravityAcc-std()-Y |
| tGravityAcc-std()-Z |
| tBodyAccJerk-mean()-X |
| tBodyAccJerk-mean()-Y |
| tBodyAccJerk-mean()-Z |
| tBodyAccJerk-std()-X |
| tBodyAccJerk-std()-Y |
| tBodyAccJerk-std()-Z |
| tBodyGyro-mean()-X |
| tBodyGyro-mean()-Y |
| tBodyGyro-mean()-Z |
| tBodyGyro-std()-X |
| tBodyGyro-std()-Y |
| tBodyGyro-std()-Z |
| tBodyGyroJerk-mean()-X |
| tBodyGyroJerk-mean()-Y |
| tBodyGyroJerk-mean()-Z |
| tBodyGyroJerk-std()-X |
| tBodyGyroJerk-std()-Y |
| tBodyGyroJerk-std()-Z |
| tBodyAccMag-mean() |
| tBodyAccMag-std() |
| tGravityAccMag-mean() |
| tGravityAccMag-std() |
| tBodyAccJerkMag-mean() |
| tBodyAccJerkMag-std() |
| tBodyGyroMag-mean() |
| tBodyGyroMag-std() |
| tBodyGyroJerkMag-mean() |
| tBodyGyroJerkMag-std() |

