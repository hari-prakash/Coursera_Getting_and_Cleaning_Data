library(data.table)

#Reading the features and activities
features <- read.table("./features.txt");
features <- features[,2];

activity_labels <- read.table("./activity_labels.txt") ;
activity_labels <- activity_labels[,2];

#Extracting all the Test data
test_x<-read.table("./test/X_test.txt");
test_y<-read.table("./test/Y_test.txt");
test_sub<-read.table("./test/subject_test.txt");

#Assigning the proper column names to test_x from features
names(test_x) = features;


#Assigning the proper column names to test_y from activity_labels
test_y[,2] = activity_labels[test_y[,1]];
names(test_y) = c("act_id","act_type");

#Assigning a column name to test_sub
names(test_sub) = "subject_id"

#Extracting the required features containg mean or std from features and then using them to extarct the req columns from test_x
req_features <- grepl("mean|std", features);
test_x = test_x[,req_features];

#Combining all the Test data
test_data <- cbind(test_sub,test_y, test_x)


#Extracting all the Train data
train_x<-read.table("./train/X_train.txt");
train_y<-read.table("./train/Y_train.txt");
train_sub<-read.table("./train/subject_train.txt")


#Assigning the proper column names to train_x from features
names(train_x) = features;


#Assigning the proper column names to train_y from activity_labels
train_y[,2] = activity_labels[train_y[,1]];
names(train_y) = c("act_id","act_type");

#Assigning a column name to train_sub
names(train_sub) = "subject_id"

#extracting the appropriate columns from train_x
train_x = train_x[,req_features];


#Combining all the Train data
train_data <- cbind(train_sub,train_y,train_x)

#Combining both the Test and Train data together
all_data <- rbind(test_data,train_data)

#Creating tiday data with the required means
tidy_data = aggregate(all_data, by=list(subject=all_data$subject_id,activity = all_data$act_type), mean)

#Removing the additional columns
tidy_data<-tidy_data[,-(3:5)]

#Writing the final table
write.table(tidy_data, "tidy_data.txt", sep="\t")
̥