run_analysis <- function(){
    
    # Determine file directory
    fileDirectory <- "./UCI HAR Dataset/"
    
    # Load activity labels + features
    activityLabels <- read.table(paste0(fileDirectory,"activity_labels.txt"), col.names=c("ActivityId", "ActivityLabel"))
    activityLabels[,2] <- as.character(activityLabels[,2])
    features <- read.table(paste0(fileDirectory,"features.txt"), col.names=c("FeatureId", "FeatureLabel"))
    features[,2] <- as.character(features[,2])
    includedFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$FeatureLabel)
    
    # load train data
    subject_train <- read.table(paste0(fileDirectory,"train/subject_train.txt"))
    X_train <- read.table(paste0(fileDirectory,"train/X_train.txt"))
    Y_train <- read.table(paste0(fileDirectory,"train/Y_train.txt"))
    
    # load test data  
    subject_test <- read.table(paste0(fileDirectory,"test/subject_test.txt"))
    X_test <- read.table(paste0(fileDirectory,"test/X_test.txt"))
    Y_test <- read.table(paste0(fileDirectory,"test/Y_test.txt"))
    
    # merge train and test data and then name them
    subject <- rbind(subject_train, subject_test)
    names(subject) <- "SubjectId"
    X <- rbind(X_train, X_test)
    X <- X[, includedFeatures]
    names(X) <- gsub("\\(|\\)", "", features$FeatureLabel[includedFeatures])
    Y <- rbind(Y_train, Y_test)
    names(Y) <- "ActivityId"
    activity <- merge(Y, activityLabels, by="ActivityId")$ActivityLabel
    
    # merge data frames of different columns to form one data table
    data <- cbind(subject, X, activity)
    write.table(data, paste0(fileDirectory,"merged_data.txt"))
    
    # create a dataset grouped by subject and activity for average calculations
    suppressMessages(library(dplyr))
    data <- group_by(data, SubjectId, activity)
    dataCalc <- summarize_each(data, funs(mean))
    write.table(dataCalc, paste0(fileDirectory,"calculated_data.txt"), row.names = FALSE)
    
}
