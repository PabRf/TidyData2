url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "directory.zip")
unzip("directory.zip", exdir = "directory")
list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/train")
list.files("UCI HAR Dataset/test")
train <- read.table("~/00.Coursera/UCI HAR Dataset/train/X_train.txt", header = F)
test <- read.table("~/00.Coursera/UCI HAR Dataset/test/X_test.txt", header = F)
features <- read.table("~/00.Coursera/UCI HAR Dataset/features.txt", header = F, stringsAsFactors = F)
subj_train <- read.table("~/00.Coursera/UCI HAR Dataset/train/subject_train.txt", header = F)
actv_train <- read.table("~/00.Coursera/UCI HAR Dataset/train/y_train.txt", header = F)
train <- cbind(subj_train$V1, actv_train$V1, train)
subj_test <- read.table("~/00.Coursera/UCI HAR Dataset/test/subject_test.txt", header = F)
actv_test <- read.table("~/00.Coursera/UCI HAR Dataset/test/y_test.txt", header = F)
test <- cbind(subj_test$V1, actv_test$V1, test)
colnames(train) <- c("Subject", "Activity", features[, 2])
colnames(test) <- c("Subject", "Activity", features[, 2])
traintest <- rbind(train, test)
dupcol <- as.data.frame(table(names(traintest)))
dupcol[names_freq[,2] > 1, ]
dataset <- traintest[, !duplicated(colnames(traintest))]
colnames(dataset)
library(dplyr)
data <- select(dataset, contains("Subject"), contains("Activity"), contains("-mean"), contains("-std"))
data$Activity[data$Activity == 1] <- "Walking"
data$Activity[data$Activity == 2] <- "Walking_Upstairs"
data$Activity[data$Activity == 3] <- "Walking_Downstairs"
data$Activity[data$Activity == 4] <- "Sitting"
data$Activity[data$Activity == 5] <- "Standing"
data$Activity[data$Activity == 6] <- "Laying"
library(mgsub)
datacols <- mgsub((names(data)), c("tBody", "tGravity", "f", "()", "BodyBody"), c("Time-Body", "Time-Gravity", "Freq-", "", "Body"), fixed = TRUE, )
colnames(data) <- datacols
write.csv(data, file = "Project-Dataset1.csv")
data_sp <- split(data, list(data$Subject, data$Activity), drop = TRUE)
data2 <- as.data.frame((sapply(data_sp, function(data_sp) colMeans(data_sp[, 3:81]))))
data2_transpose <- as.data.frame(t(as.matrix(data2)))
write.csv(data2_transpose, file = "Project-Dataset2.csv")


