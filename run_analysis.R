library(data.table)
#Loading test and training data  
  test = read.table("UCI HAR Dataset/test/subject_test.txt")
  X_test = read.table("UCI HAR Dataset/test/X_test.txt")
  Y_test = read.table("UCI HAR Dataset/test/Y_test.txt")
  train = read.table("UCI HAR Dataset/train/subject_train.txt")
  X_train = read.table("UCI HAR Dataset/train/X_train.txt")
  Y_train = read.table("UCI HAR Dataset/train/Y_train.txt")
  
  #Loading feature tables
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("feature_Id", "feature_Label"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel"))
  activities$activityLabel <- gsub("_", "", as.character(activities$activityLabel))
  includedFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$feature_Label)
  
  #Merging and naming data
  subject <- rbind(test, train)
  names(subject) <- "subjectId" 
  X <- rbind(X_test, X_train)
  X <- X[, includedFeatures]
  names(X) <- gsub("\\(|\\)", "", features$feature_Label[includedFeatures])
  Y <- rbind(Y_test, Y_train)
  names(Y) = "activityId"
  activity <- merge(Y, activities, by="activityId")$activityLabel
  data <- cbind(subject, X, activity)
  write.table(data, "merged_data.txt")
  
  #Calculations and storing data into txt file
  tempdata <- data.table(data)
  tidyData<- tempdata[, lapply(.SD, mean), by=c("subjectId", "activity")]
  write.table(tidyData, "TidyData.txt",row.names=FALSE)
