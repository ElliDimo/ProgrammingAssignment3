# ProgrammingAssignment3
Repo for the Getting and Cleaning Data Course Programming Assignment of Week 4


The data files needed for this assignment are :

- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'Subject_test.txt': Each row identifies the subject who performed the activity for each window sample of test data set. Its range is from 1 to 30.
- 'Subject_train.txt': Each row identifies the subject who performed the activity for each window sample of train data set. Its range is from 1 to 30.


This assignment was conducted via the execution of one R script file, named 'C03Assignment.R', and one corresponding function named 'function3'. 
The execution steps of function3, as well as the description of the used variables are mentioned in CodeBook.md


The R script file reads all data provided in the above data files and creates the 'Tidy_data_set.csv', containing the final tidy data set. 

The final tidy data set includes the calculated mean of all the mean and standard deviation variables/features included in the original data sets, 
calculated by Subject (1-30) and Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).




