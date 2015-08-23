library(plyr)

# 1. Merge the training and the test sets to create one data set.

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./UCI HAR Dataset/features.txt")

# get only columns with mean or std in their names
required_features <- grep("-(mean|std)\\(\\)", features[, 2])

# get the desired columns
x_data <- x_data[, required_features]

# change the column names
names(x_data) <- features[required_features, 2]

# 3. Use descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# change column name
names(y_data) <- "activity"

# 4. Appropriately label the data set with descriptive variable names

# change column name
names(subject_data) <- "subject"

# create a single data set
all_data <- cbind(x_data, y_data, subject_data)

# 5. Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

averages_data <- ddply(all_data, c("subject", "activity"), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
