# Downloading and unzipping the file

if(!file.exists("./data")){dir.create("./data")}
Url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%2ODataset.zip"
download.file(Url,destfile="./data/dataset.zip",method="curl")
unzip("./data/dataset.zip")

# Merging the training and test sets to create one data set
# Reading training tables
x_train <-read.table("UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

# Reading test tables
x_train <-read.table("UCI HAR Dataset/train/X_test.txt")
y_train <-read.table("UCI HAR Dataset/train/y_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_test.txt")

# Reading feature vector
features <-read.table("./data/UCI HAR Dataset/features.txt")

# Reading activity labels
activitylabels <-read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Assigning column names
colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colname(subject_train) <-"subjectId"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test)<-"subjectId"

colnames(actvitylabels) <- c("activityId","activityType")

# Merging all data in one set
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
setallinone <- rbind(merge_train, merge_test)

# Extracting only the measurements on the mean and standard deviation for each measurement
colnames <-colnames(setallinone)
mean_n_std <-(grep("activityId",colnames) | grep("subjectId", colnames) | grep("mean..", colnames) |
grep("std..",colnames))
set_mean_n_std<-setallinone[ , mean_n_std ==TRUE]

# Using descriptive activity names to name the activities in the data set
set_activity_names <- merge(set_mean_n_std, activitylabels, by="activityId", all.x =TRUE)

# Creating a second, indepedent tidy data set with the average of each variable for each activity
# and each subject ad wrting this dataset in text file
tidyset2 <- aggregate(. ~subjectId + activityId, set_activity_names, mean)
tidyset2 <- tidyset2(order(tidyset2$subjectId, tidyset2$activityId))
write.table(tidyset2,"tidyset2.txt", row.name=FALSE)


 
