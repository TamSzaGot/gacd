---
title: "README"
author: "Tamas Szabo"
date: '2016-04-03'
output: html_document
---
Coursera
John Hopkins University
Getting and Cleaning Data
March 7 – April 11

Getting and Cleaning Data Course Project

The requirement for this assignment is to create an R script for generation of a tidy data set consisting of the avarages of certean features from this much bigger dataset:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The features of interest are the ones named "mean" and "std" and has to be avaraged while grouping the data over the two features subject and activity.

The original data were created in an experiment where 30 volunteers (whose id is in the feature **subject**) were performing 6 different activities (defined in the feature **activity**: walking, walking upstairs, walking downstairs, sitting, standing and laying) while a Samsung Galaxy S II where attached to their body. The smart phone's accelerometer and gyroscope were sampeled and the resulting time series were prepared and calculated in different ways to yield the 561 features of the original data set. Since the features starting with 'f' are being calculated by FFT I decided to only have times series data in the tidy data set. Fetaures starting with 't'.

Besides the features in the sampeled and extracted data two other features are available, subject - the id of the volunteer who performed the experiment, and activity - what kind of activity the person were carrying out.

The originla data are divided into train and test in the zip archive.

The [run\_analysis.R](run\_analysis.R) script merges the train and test datasets and add the two feature vectors for subject and activity, before it extracts the 40 features with time series data starting with 't' and marked with "mean" and "std". After that the script groups the data by subject and activity while calculating the mean of the features, resulting in 180 rows of data. Finally the data is saved to a file named [tidy\_data.csv](data/tidy_data.csv) submitted in the repo.

The [CodeBook.md](./CodeBook.md) file describes the resulting features.



