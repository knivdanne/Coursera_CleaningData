#reads in all the data
testy <- read.table("test/Y_test.txt")
trainy <- read.table("train/Y_train.txt")

testsub <- read.table("test/subject_test.txt")
trainsub <- read.table("train/subject_train.txt")

testx <- read.table("test/X_test.txt")
trainx <- read.table("train/X_train.txt")

#binds the test and train data together
y <- rbind(testy,trainy)

sub <- rbind(testsub,trainsub)

x <- rbind(testx,trainx)

#gives descriptive column names for the dataframes
names(y) <- "label"

names(sub) <- "subject"

names(x) <- read.table("features.txt")$V2

#binds all the data sets together
yx <- cbind(y,x,sub)

#reads in the activity names
activities <- read.table("activity_labels.txt")
names(activities) <- c("label","activity")

#adds the activity names into the main data set
yx <- merge(yx,activities,on="label",all.x=T)

#only keep columns that have a name containing mean(),std(),activity, or subject
df <- yx[,grep("mean\\(\\)|std\\(\\)|activity|subject",names(yx))]

#creates a tidy data set by aggregating all the mean() and std() values by taking the mean for each value grouped by activity and subject
tidy <- aggregate(df[,1:66],by=df[,67:68],FUN=mean)
