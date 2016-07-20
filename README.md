# Coursera - Getting and Cleaning Data Course Project


Introduction
------------

+ This repository contains all the work done towards my final project for the Getting and Cleaning Data Course from the Coursera Data Science Specialization offered by Johns Hopkins University and taught by Prof. Jeff Leeks
+ Here is a description about the data given and then a little bit about the analysis and the quantites computed


The Raw Data Given
------------------
+ The folder conatins the data from the expreiments conducted on 30 subjects while they were doing six different activities like wallking, standing, sitting etc. All the six activies are listed in the activity_labels.txt file. More information about the experiment can also be found in README.txt, written by the original scientists found in the same directory
+ An accelerometer and gyroscope were used to measure the data on these subjects. A total of 561 features were measured. The names of these features are found in features.txt file. More detailed information about the features being measured is found in features_info.txt
+ The data was available in two different folders, test and trian, which contained 30% and 70% of the entire data respectively. Both thse folders had 3 files called x_test/x_train, y_test/y_train and subject_test/subject_train
+ The first file (x_test/x_train) contained all the raw values of all the features
+ Second one contaied the actvity ID (type) of  the experiments
+ The last one conatined the subject id, telling us which subject performed the experiment
+ The additional data given in Inertial Signal was not neccessary for this analysis and can be ignored


The Script
----------

+ The script labels all the data using the activity_labels, features etc. It arranges all the three text files in each folder (train/test) and then also combines the test and train data together.
+ It only selects the features containing mean and standarad deviation values from x set
+ It then summarizes the average value for all the colums for an activity and for a subject. Total of 30 subjects and each subject does six activites. So, a total of 180 rows can be found in the final tidy_data data table.
 

