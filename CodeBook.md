

#Getting and Cleaning Data Course Project

* The data used in this course project represent data collected from the accelerometers from the Samsung Galaxy S smartphones.
For a full description please visit the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones [^fn1]

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The script "run_analysis.R" does the following:

1) load the libraries _data.table_ and _dplyr_ needed to run the script
2) read the files _subject_test.txt_, _y_test.txt_, _X_test.txt_ contained in folder **test** as well as the files _subject_train.txt_, _y_train.txt_, _X_train.txt_ in folder **train**
3) extract features and activity names to Label the data sets with descriptive variable names
4) merge the training and the tests sets to create one data set
5) coerce the column names to obtain syntactically valid ones
6) extract only the measurements on the mean and standard deviation for each measurement (**sel_data**)
7) use descriptive activity names to name the activities in the selected data set
8) create a second independent tidy data set with the average of each variable for each activity and each subject (**mean_data**)
9) create the output files _sel_data.csv_ and _mean_data.csv_
10) Re-initialize the Global Environment.

:kissing_closed_eyes:

[^fn1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012