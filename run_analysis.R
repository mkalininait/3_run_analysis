library(data.table)

RunAnalysis <- function() {
        ## Objectives of the script:
        ## 1. Merges the training and the test sets to create one data set.
        ## 2. Extracts only the measurements on the mean and standard deviation 
        ## for each measurement. 
        ## 3. Uses descriptive activity names to name the activities in the data
        ## set
        ## 4. Appropriately labels the data set with descriptive variable names. 
        ## 5. From the data set in step 4, creates a second, independent tidy 
        ## data set with the average of each variable for each activity and each 
        ## subject.        
        
        ## merging two sets of data, two sets of activities and two sets of 
        ## subjects
        trSet <- fread('UCI HAR Dataset/train/X_train.txt')
        testSet <- fread('UCI HAR Dataset/test/X_test.txt')
        dataSet <- rbind(trSet, testSet)
        trAct <- fread('UCI HAR Dataset/train/Y_train.txt')
        testAct <- fread('UCI HAR Dataset/test/Y_test.txt')
        actSet <- rbind(trAct, testAct)
        trSubj <- fread('UCI HAR Dataset/train/subject_train.txt')
        testSubj <- fread('UCI HAR Dataset/test/subject_test.txt')
        subjSet <- rbind(trSubj, testSubj)
        
        ## getting data on mean and standard deviation 
        ## for each measurement
        features <- fread('UCI HAR Dataset/features.txt')
        dataNames <- make.names(features$V2) ## invalid column names are fixed
        setnames(dataSet, dataNames) 
        meanDevNames <- c(grep("mean..", dataNames, fixed = TRUE), grep("std..", dataNames, fixed = TRUE))
        meanDevData <- dataSet[, meanDevNames, with = FALSE]
        
        ## adding data on activities and subjects to the table
        activities <- fread('UCI HAR Dataset/activity_labels.txt')
        actNames <- activities$V2
        actSetLabels <- actSet[, actNames[V1]]
        fullData <- meanDevData[, Activity:=actSetLabels] [, Subject:=subjSet$V1]
        
        ## getting a tidy data set with the average of each variable 
        ## for each activity and each subject
        avgData <- copy(fullData)
        avgData <- avgData[, lapply(.SD, mean), by = list(Activity, Subject)]
        avgData <- avgData[order(Activity, as.numeric(Subject))]
        
        ## cleaning up column names
        setnames(avgData, gsub("mean..", "mean", names(avgData)))
        setnames(avgData, gsub("std..", "std", names(avgData)))
        
        ## saving the tidy data set as a txt file
        write.table(avgData, file = "activity_data_avg.txt", row.names = F)
}