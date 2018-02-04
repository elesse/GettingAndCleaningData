# Load libraries

library(data.table)
library(dplyr)

# Read Dataset

subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt")
y_test <- fread("./UCI HAR Dataset/test/y_test.txt")
x_test <- fread("./UCI HAR Dataset/test/X_test.txt")

subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt")
y_train <- fread("./UCI HAR Dataset/train/y_train.txt")
x_train <- fread("./UCI HAR Dataset/train/X_train.txt")

# Extract features and activity names

cnames <- fread("./UCI HAR Dataset/features.txt")

lActivities <- fread("./UCI HAR Dataset/activity_labels.txt")

# Label the data sets with descriptive variable names

colnames(y_test) <- "activity"
colnames(subject_test) <- "subject"
colnames(x_test) <- as.character(cnames$V2)
all_test <- cbind(subject_test, y_test, x_test)

colnames(y_train) <- "activity"
colnames(subject_train) <- "subject"
colnames(x_train) <- as.character(cnames$V2)
all_train <- cbind(subject_train, y_train, x_train)

# Merge the training and the tests sets to create one data set

all_data <- rbind(all_test, all_train)

# Coerce column names to obtain syntactically valid ones

valid_names <- make.names(names=names(all_data), unique=TRUE, allow_ = TRUE)
names(all_data) <- valid_names

# Extract only the measurements on the mean and standard deviation for each measurement

sel_data <- select(all_data, matches("subject|activity|\\.mean\\.|\\.std\\."))

names(sel_data) <- gsub(names(sel_data), pattern = "\\.\\.", replacement = "")

# Use descriptive activity names to name the activities in the selected data set

sel_data$activity <- lActivities$V2[match(sel_data$activity, lActivities$V1)]

write.table(sel_data, file = "sel_data.txt", row.names = FALSE)

# From the previous data set, create a second independent tidy data set with the average
# of each variable for each activity and each subject

mean_data <- sel_data %>% group_by(subject, activity) %>% summarise_all(funs(mean))

write.table(mean_data, file = "mean_data.txt", row.names = FALSE)

# Re-initialize the Global Environment

rm(list = ls())