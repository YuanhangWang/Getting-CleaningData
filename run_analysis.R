## This function is used to analysis the origin data and create a new dataset in
## a new format.

## @path
##   Where the folder of the required data locates.
## @file.name
##   the name of output file.
## @debug
##   if you need some information to debug this function, please turn on it
run.analysis <- function(path = "./UCI HAR Dataset", file.name = "output.txt", debug = FALSE) {
  ## Read traing and test data
  print("--->Reading training data...")
  x.train <- read.table(paste(path, "train", "X_train.txt", sep = "/"))
  y.train <- read.table(paste(path, "train", "y_train.txt", sep = "/"))
  subject.train <- read.table(paste(path, "train", "subject_train.txt", sep = "/"))
  print("--->Reading test data")
  x.test <- read.table(paste(path, "test", "X_test.txt", sep = "/"))
  y.test <- read.table(paste(path, "test", "y_test.txt", sep = "/"))
  subject.test <- read.table(paste(path, "test", "subject_test.txt", sep = "/"))
  if(debug) {
    print("--->Before merging...")
    print(dim(x.train))
    print(dim(y.train))
    print(dim(subject.train))
    print(dim(x.test))
    print(dim(y.test))
    print(dim(subject.test))
  }
  ## Merge training and test
  x <- rbind(x.train, x.test)
  y <- rbind(y.train, y.test)
  subject <- rbind(subject.train, subject.test)
  ## Relese spaces
  rm(x.train, y.train, x.test, y.test, subject.train, subject.test)
  if(debug) {
    print("--->After merging...")
    print(dim(x))
    print(dim(y))
    print(dim(subject))
  }
  ## Read and set name of x
  x.names <- read.table(paste(path, "features.txt", sep = "/"))
  colnames(x) <- x.names[, 2]
  if(debug) {
    print("--->Named x...")
    print(x[1:5,1:5])
  }
  ## Extract columns which has mean or std in its column name
  pattern <- "mean|std"
  x <- x[, grepl(pattern, colnames(x))]
  if(debug) {
    print("--->No. of columns which are not mean nor std")
    print(sum(!grepl(pattern, colnames(x))))
  }
  ## label y
  colnames(y) <- c("activity_labels")
  y.label <- paste(path, "activity_labels.txt", sep = "/")
  y.label <- read.table(y.label, colClass = c("numeric", "character"))
  y[[1]] <- factor(y[[1]], labels = y.label[, 2])
  if(debug) {
    print("--->After labeling...")
    print(summary(y))
  }
  ## label subject
  colnames(subject) <- c("subject.no")
  if(debug) {
    print("--->After labeling...")
    print(head(subject))
  }
  ## merge x, y and subject
  data <- cbind(x, y, subject)
  rm(x, y, subject)
  if(debug) {
    print("--->All-in-one data...")
    print(data[1:5, c(1:5, 80, 81)])
  }
  ## split data according to activity_labels
  data <- split(data, data$activity_labels)
  ## Function used to aggregate the data by subject and calculate mean.
  agg <- function(x) {
    aggregate(.~ x$subject.no, data = x[, 1:79], mean)
  }
  ## make aggregate on each activity.
  data <- lapply(data, agg)
  if(debug) {
    print("--->Printing part of esults...")
    for (i in seq(along = data)) {
      print(names(data[i]))
      print(data[[i]][1:5, 1:5])
    }
  }
  ## output result to file.name
  write.table(data, file.name)
  print(paste("--->Please check", file.name, "for result"))
}