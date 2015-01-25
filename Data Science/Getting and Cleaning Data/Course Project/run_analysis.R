# 1)
features <- read.table('UCI HAR Dataset/features.txt', header = FALSE);
colnames(features) <- c('feature_id', 'feature_name');

subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt', header=FALSE, colClasses='integer');
x_train <- read.table('UCI HAR Dataset/train/X_train.txt', header=FALSE, colClasses="numeric");
y_train <- read.table('UCI HAR Dataset/train/y_train.txt', header=FALSE, colClasses='integer');

colnames(subject_train) <- ('subject_id');
colnames(x_train) <- features$feature_name;
colnames(y_train) <- 'activity_id';

training_data <- cbind(y_train, subject_train, x_train);

subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt', header=FALSE, colClasses='integer');
x_test <- read.table('UCI HAR Dataset/test/X_test.txt', header=FALSE, colClasses="numeric");
y_test <- read.table('UCI HAR Dataset/test/y_test.txt', header=FALSE, colClasses='integer');
colnames(subject_test) <- ('subject_id');
colnames(x_test) <- features$feature_name;
colnames(y_test) <- 'activity_id';

test_data <- cbind(y_test, subject_test, x_test);

full_data <- rbind(training_data, test_data);

# 2)
full_data_cols <- colnames(full_data);
valid_cols <- (grepl("activity",full_data_cols) | grepl('subject', full_data_cols) | grepl('-(mean|std)\\(\\)', full_data_cols));
valid_full_data <- full_data[, valid_cols];

# 3)
activities <- read.table('UCI HAR Dataset/activity_labels.txt', header = FALSE, );
colnames(activities) <- c('activity_id', 'activity_name');

valid_full_data[,'activity_id'] <- activities[valid_full_data[,'activity_id'],'activity_name']
colnames(valid_full_data)[1] <- 'Activity';

# 4)
newColNames <- colnames(valid_full_data);
for (i in 1:length(newColNames)) 
{
  newColNames[i] = gsub("^(t)","Time ",newColNames[i])
  newColNames[i] = gsub("^(f)","Freq ",newColNames[i])
  newColNames[i] = gsub("Acc","Acceleration ",newColNames[i])
  newColNames[i] = gsub("-mean","Mean",newColNames[i])
  newColNames[i] = gsub("\\()","",newColNames[i])
  newColNames[i] = gsub("-std","Standard Deviation",newColNames[i])
  newColNames[i] = gsub("([Gg]ravity)","Gravity ",newColNames[i])
  newColNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body ",newColNames[i])
  newColNames[i] = gsub("[Jj]erk","Jerk ",newColNames[i])
  newColNames[i] = gsub("[Gg]yro","Gyro ",newColNames[i])
  newColNames[i] = gsub("Mag","Magnitude ",newColNames[i])
};

colnames(valid_full_data) <- newColNames;

# 5)
library(plyr);
avg_data_set <- ddply(valid_full_data, 
                      .(Activity, subject_id), 
                      function(x) colMeans(x[, 3:68])
                      );

write.table(avg_data_set, 'avg_data.txt', row.name=FALSE);
