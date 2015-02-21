library(dplyr)

# read test data
x_test <- read.table("~/Downloads/UCI HAR Dataset/test/X_test.txt",
                     header = F)
# read training data
x_train <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt",
                      header = F)

# merge training and test datasets
dat <- bind_rows(x_train[,], x_test[,])

# read features
features <- read.table("~/Downloads/UCI HAR Dataset/features.txt",
                       header = F)
# assign column names to merged data from features
names(dat) <- features[,2]
# Extracts only the measurements on the mean and standard deviation for each measurement
dat2 <- dat[,grepl("mean\\b()|std\\b()",names(dat))]

# read activity labels in test data
y_test <- read.table("~/Downloads/UCI HAR Dataset/test/y_test.txt",
                     header = F)
names(y_test) <- "activity"
# read activity labels in training data
y_train <- read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt",
                      header = F)
names(y_train) <- "activity"
# merge activity labels from training and test datasets
activity_label <- bind_rows(y_train, y_test)

# read subject id in test data
subject_test <- read.table("~/Downloads/UCI HAR Dataset/test/subject_test.txt",
                           header = F)
names(subject_test) <- "id"
# read subject id in training data
subject_train <- read.table("~/Downloads/UCI HAR Dataset/train/subject_train.txt",
                            header = F)
names(subject_train) <- "id"
# merge activity labels from training and test datasets
subject_id <- bind_rows(subject_train, subject_test)

# merge activity_label, subject_id and dat2 into one dataset
dat3 <- bind_cols(activity_label, subject_id, dat2)

# read activity label factors
activity_label2 <- read.table("~/Downloads/UCI HAR Dataset/activity_labels.txt",
                                               header = F)
dat4 <- 
  dat3 %>%
  # use descriptive names of activities
  mutate(activity = factor(activity, levels = 1:6, 
                                       labels = activity_label2[,2])) %>%
  # create dataset with the average of each variable for each activity
  # and each subject
  group_by(id, activity) %>%
  summarise_each(funs(mean), -(1:2))

# write dat4 to text file
write.table(dat4, file = "~/Downloads/tidydata.txt", row.names = FALSE)
