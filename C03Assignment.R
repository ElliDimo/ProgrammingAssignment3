function3 <- function() {
   
    # reading the data
    dataX_test <- read.table('X_test.txt',header=F) # test data frame of 2947 obs. and 561 variables - features
    dataY_test <- read.table('y_test.txt',header=F) # test data frame of 2947 obs. and 1 variable - activity
    dataX_train <- read.table('X_train.txt',header=F) # train data frame of 7352 obs. and 561 variables - features
    dataY_train <- read.table('y_train.txt',header=F) # train data frame of 7352 obs. and 1 variable - activity
    names_features <- read.table('features.txt',header=F) # names of features - headers of 561 variables
    labels_mapping <- read.table('activity_labels.txt',header = F) # mapping of activity numbers and activity labels
    subjectX_test <- read.table('subject_test.txt',header=F) # test data frame of 2947 obs. and 1 variable - subject
    subjectX_train <- read.table('subject_train.txt',header=F) # train data frame of 7352 obs. and 1 variable - subject
    
    # giving headers to the datasets dataX - labellling the data sets with descriptive variable names
    names(dataX_test) <- as.character(names_features$V2)
    names(dataX_train) <- as.character(names_features$V2)
    
    # creating activity label column in dataY data sets corresponding to the activity numbers
    for(i in 1:2947){dataY_test$Activity[i] <- as.character(labels_mapping[which(labels_mapping$V1== dataY_test$V1[i]),2])}
    for(i in 1:7352){dataY_train$Activity[i] <- as.character(labels_mapping[which(labels_mapping$V1== dataY_train$V1[i]),2])}
    
    # giving headers to dataY datasets 
    names(dataY_train)[1]<-'Activity number'
    names(dataY_train)[2]<-'Activity label'
    names(dataY_test)[1]<-'Activity number'
    names(dataY_test)[2]<-'Activity label'
    
    # creating 'Activity' column in dataX datasets from corresponding activity labels of dataY$Activity column
    dataX_test$Activity <- dataY_test$`Activity label`
    dataX_train$Activity <- dataY_train$'Activity label'
    
    # creating 'Subject' column in dataX datasets from corresponding subjectX data sets
    dataX_test$Subject <- subjectX_test$V1
    dataX_train$Subject <- subjectX_train$V1
    
    # row binding of test and train dataX data sets
    dataX <- rbind(dataX_test,dataX_train) # merged dataset of 10299 obs. and 563 variables
    
    # finding the indices of the columns of mean and std variables
    indices_mean_std <- grep('-mean()|-std()',names_features$V2)
    
    # extracting only mean and std columns, as well as Activity and Subject columns, in new data frame 
    mean_stdX<-dataX[,c(indices_mean_std,562,563)]

    # creating categorical variables/factor columns of Subject and Activity groups
    mean_stdX$Sub_Group <- factor(mean_stdX$Subject)
    mean_stdX$Act_Group <- factor(mean_stdX$Activity)
    
    # melting the data frame, giving id and variable attributes to columns
    library(reshape2)
    vars <- names(mean_stdX)[1:79]
    meltX <-melt(mean_stdX, id=c('Sub_Group','Act_Group'), measure.vars=vars)
   
    # casting the final tidy data set by calculating the mean of each variable by Subject and Activity groups
    castX <- dcast(meltX, Sub_Group + Act_Group ~ variable,mean) 
    
    # returning the final data set
    castX
    
}