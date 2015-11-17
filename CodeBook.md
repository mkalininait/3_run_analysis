## Run Analysis
A course project for the <a href="https://www.coursera.org/course/getdata">"Getting and Cleaning Data" course</a>.

### Study design

The experiments have been carried out by Smartlab with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. Using its embedded accelerometer and gyroscope, Smartlab captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Description of the original experiment is available on the website: 
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

### Original data

For each record it is provided:
 * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
 * Triaxial Angular velocity from the gyroscope
 * A 561-feature vector with time and frequency domain variables
 * Its activity label (in a separate file)
 * An identifier of the subject who carried out the experiment (in a separate file)

Description of variables and the data itself are available here:
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

### Cleaning process

Performed on OS X El Capitan Ver. 10.11.1, R ver. 3.2.2 (2015-08-14).

The `run_analysis.R` script performs the following data processing:

1. Reads the original files and merges the training and the test sets:
  * `X_train.txt` + `X_test.txt` -> `dataSet` (table of 561 variables) 
  * `Y_train.txt` + `Y_test.txt` -> `actSet` (table of activity codes)
  * `subject_train.txt` + `subject_test.txt` -> `subjSet` (table of subject numbers)
2. Appropriately labels the data set with descriptive variable names:
 * Reads the variable descriptive names from `features.txt`
 * Converts the names to valid names by excluding dashes and parenthesis
 * Assigns names to the `dataSet`
3. Extracts only the measurements on the mean and standard deviation:
 * Parses column names
 * Saves necessary columns to the `meanDevData` table
4. Adds descriptive activity names and subjects to the data set:
 * Reads activity labels from `activity_labels.txt`
 * Associates activity codes with labels
 * Adds columns "Activity" and "Subject" to the `meanDevData` table
 * The output table is `fullData`
5. From the data set in step 4, creates a second, independent tidy data set:
 * Copies the `fullData` table into `avgData`
 * Computes the average of each variable for each activity and each subject
 * Orders new data set by activity and subject
 * Writes the resulting table in the file `activity_data_avg.txt`

### Output data set

The output data set is a table of 68 variables:

1. `Activity` - one of six possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
2. `Subject` -  one of 30 participants, numeric value in the range (1:30)

3-68. Average values of Means and Standard Deviations estimated from the accelerometer and gyroscope signals:
 * `tBodyAcc.mean.X`
 * `tBodyAcc.mean.Y`
 * `tBodyAcc.mean.Z`
 * `tGravityAcc.mean.X`
 * `tGravityAcc.mean.Y`
 * `tGravityAcc.mean.Z`
 * `tBodyAccJerk.mean.X`
 * `tBodyAccJerk.mean.Y`
 * `tBodyAccJerk.mean.Z`
 * `tBodyGyro.mean.X`
 * `tBodyGyro.mean.Y`
 * `tBodyGyro.mean.Z`
 * `tBodyGyroJerk.mean.X`
 * `tBodyGyroJerk.mean.Y`
 * `tBodyGyroJerk.mean.Z`
 * `tBodyAccMag.mean`
 * `tGravityAccMag.mean`
 * `tBodyAccJerkMag.mean`
 * `tBodyGyroMag.mean`
 * `tBodyGyroJerkMag.mean`
 * `fBodyAcc.mean.X`
 * `fBodyAcc.mean.Y`
 * `fBodyAcc.mean.Z`
 * `fBodyAccJerk.mean.X`
 * `fBodyAccJerk.mean.Y`
 * `fBodyAccJerk.mean.Z`
 * `fBodyGyro.mean.X`
 * `fBodyGyro.mean.Y`
 * `fBodyGyro.mean.Z`
 * `fBodyAccMag.mean`
 * `fBodyBodyAccJerkMag.mean`
 * `fBodyBodyGyroMag.mean`
 * `fBodyBodyGyroJerkMag.mean`
 * `tBodyAcc.std.X`
 * `tBodyAcc.std.Y`
 * `tBodyAcc.std.Z`
 * `tGravityAcc.std.X`
 * `tGravityAcc.std.Y`
 * `tGravityAcc.std.Z`
 * `tBodyAccJerk.std.X`
 * `tBodyAccJerk.std.Y`
 * `tBodyAccJerk.std.Z`
 * `tBodyGyro.std.X`
 * `tBodyGyro.std.Y`
 * `tBodyGyro.std.Z`
 * `tBodyGyroJerk.std.X`
 * `tBodyGyroJerk.std.Y`
 * `tBodyGyroJerk.std.Z`
 * `tBodyAccMag.std`
 * `tGravityAccMag.std`
 * `tBodyAccJerkMag.std`
 * `tBodyGyroMag.std`
 * `tBodyGyroJerkMag.std`
 * `fBodyAcc.std.X`
 * `fBodyAcc.std.Y`
 * `fBodyAcc.std.Z`
 * `fBodyAccJerk.std.X`
 * `fBodyAccJerk.std.Y`
 * `fBodyAccJerk.std.Z`
 * `fBodyGyro.std.X`
 * `fBodyGyro.std.Y`
 * `fBodyGyro.std.Z`
 * `fBodyAccMag.std`
 * `fBodyBodyAccJerkMag.std`
 * `fBodyBodyGyroMag.std`
 * `fBodyBodyGyroJerkMag.std`

The data set contains data from both trainig and test sets.
No measurement units are provided in the raw data.
