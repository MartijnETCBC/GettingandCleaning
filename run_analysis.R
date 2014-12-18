#data testset
datatest <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/test/X_test.txt", header = FALSE)
features <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/features.txt", header = FALSE)
betfeat <- gsub('\\(','',features[,2])
betfeat2 <- gsub('\\)','',betfeat)
betfeat3 <- gsub('-','_',betfeat2)
colnames(datatest) <- betfeat3
totdatselecttest <- datatest[,grep('mean|std',colnames(datatest))]
activecodetest <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/test/y_test.txt", header = FALSE)
newsettest <- cbind(activecodetest, totdatselecttest)
colnames(newsettest)[1] <- 'act_code'
subtest <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/test/subject_test.txt", header = FALSE)
newersettest <- cbind(subtest, newsettest)
colnames(newersettest)[1] <- 'subject'

# data train set
datatrain <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/train/X_train.txt", header = FALSE)
colnames(datatrain) <- betfeat3
totdatselecttrain <- datatrain[,grep('mean|std',colnames(datatrain))]
activecodetrain <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/train/y_train.txt", header = FALSE)
newsettrain <- cbind(activecodetrain, totdatselecttrain)
colnames(newsettrain)[1] <- 'act_code'
subtrain <- read.table("c:/users/martijn/documents/CourseraDataScience/GettingandCleaning/data_UCI_HAR/train/subject_train.txt", header = FALSE)
newersettrain <- cbind(subtrain, newsettrain)
colnames(newersettrain)[1] <- 'subject'

# merge datasets
totdat <- rbind(newersettest, newersettrain)

#change act_number to activity-word
totdat$activity[totdat$act_code == 1] <- "walking"
totdat$activity[totdat$act_code == 2] <- "walking_upstairs"
totdat$activity[totdat$act_code == 3] <- "walking_downstairs"
totdat$activity[totdat$act_code == 4] <- "sitting"
totdat$activity[totdat$act_code == 5] <- "standing"
totdat$activity[totdat$act_code == 6] <- "laying"

totdat$act_code <- NULL

#brings activity to the front
totdat2 <- cbind(totdat$activity, totdat)
totdat2[,82] <- NULL
colnames(totdat2)[1] <- 'activity'

#calculates mean for groups
aggdata <- aggregate(totdat2, by=list(totdat2$subject, totdat2$activity), FUN=mean)
aggdata$subject <- NULL
aggdata$activity <- NULL
colnames(aggdata)[1] <- 'subject'
colnames(aggdata)[2] <- 'activity'
