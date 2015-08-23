

# Getting and Cleaning Data Assignment

This is an assignment done as a part of Coursera course on Getting an Cleaning data in Data Science specialization.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
The source of data was collected from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and description of the same is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The steps followed in the script to get and clean data is as follows:

1. Loading test and training data from test and train dataset
2. Loading feature table from feature.text and labels for the output table from activity_labels.txt
3. Merging and naming data using rbind for data row merging and cbind for data column merging
4. Calculating mean and standard deviation and storing final data into TidyData.txt file

