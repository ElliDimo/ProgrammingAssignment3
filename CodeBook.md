# ProgrammingAssignment3
Repo for the Getting and Cleaning Data Course Programming Assignment of Week 4

This assignment was conducted via the execution of one R script file, named 'run_analysis.R', and one corresponding function named 'function3'. The execution 
steps of function 3, as well as the description of the used variables are mentioned below:

   
    1. Reading the data
    dataX_test : test data frame of 2947 obs. and 561 variables (features), as read from the 'X_test.txt' file
    dataY_test : test data frame of 2947 obs. and 1 variable (activity), as read from the 'y_test.txt' file
    dataX_train : train data frame of 7352 obs. and 561 variables (features), as read from the 'X_train.txt' file
    dataY_train : test data frame of 7352 obs. and 1 variable (activity), as read from the 'y_train.txt' file
    names_features : names of 561 feature variables, as read from 'features.txt' file
    labels_mapping : mapping between activity numbers and activity labels, as read from 'activity_labels.txt' file
    subjectX_test : test data frame of 2947 obs. and 1 variable - subject, as read from 'subject_test.txt' file
    subjectX_train : train data frame of 7352 obs. and 1 variable - subject, as read from 'subject_train.txt' file
    
    2. Giving headers to the datasets dataX_test & dataX_train - labelling the data sets with the corresponding descriptive variable names from the names_features vector
    
    3. Creating an 'Activity label' column in dataY_test & dataY_train data sets, corresponding to the activity number of each row, via the use of labels_mapping
    
    4. Giving headers 'Activity number' and 'Activity label' to dataY_test & dataY_train data sets 
    
    5. Creating an 'Activity' column in dataX_test & dataX_train data sets from the corresponding 'Activity label' columns of dataY_test and dataY_train data sets
    
    6. Creating a 'Subject' column in dataX_test & dataX_train data sets from the corresponding subjectX_test and subjectX_train data sets
    
    7. Merging the dataX_test & dataX_train data sets via row binding into one data set, named 'dataX'
    
    8. Storing the indices of the columns of mean and std variables in a vector called 'indices_mean_std'. This was done via the grep() function,  
       by searching for the expressions '-mean()' and '-std()' in names_features vector.
    
    9. Extracting the mean and std columns, as well as Activity and Subject columns, and storing them in a new data frame, called 'mean_stdX'

    10. Creating categorical variables/factor columns of Subject and Activity Groups, named 'Sub_Group' and 'Act_Group', in data frame 'mean_stdX'

    11. Melting the 'mean_stdX' data frame, by giving id and variable attributes to columns (use of reshape2 package):
        - id elements: 'Sub_Group','Act_Group'
        - measure variables : all other variables of mean and std columns
   
    12. Casting the final tidy data set, named 'castX', by calculating the mean of each variable by Subject and Activity groups (id elements : 'Sub_Group','Act_Group')
    
    13. Writing the final tidy data set, 'castX', in a txt file named 'Tidy_data_set.txt'
    
    14. Returning the final data set 'castX', as the result of function3.