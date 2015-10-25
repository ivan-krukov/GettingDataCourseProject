require(stringr)

getData <- function(localSource = "UCI_HAR_Dataset.zip") {
  remoteSource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if (!file.exists(localSource)) {
    download.file(remoteSource, localSource)
  }
  unzip(localSource)
}

getStringColumn <- function(path, index) {
  stringData <- read.table(path, stringsAsFactors = F)
  str_to_lower(stringData[[index]])
}

prepareData <- function(dir, name, yFactors, features, featureLabels) {
  activityData <- read.table(file.path(dir, name,
                                   str_c("y_", name, ".txt")),
                             col.names = "activity")
  activity <- factor(activityData$activity, labels = yFactors)
  subject <- read.table(file.path(dir, name,
                                  str_c("subject_", name, ".txt")),
                        col.names = "subject")
  observations <- read.table(file.path(dir, name,
                                       str_c("X_", name, ".txt")),
                             col.names = featureLabels)
  
  return(data.frame(subject = subject,
                    activity = activity,
                    observations[,desiredFeatures]))
}

#getData()
dir <- "UCI HAR Dataset"

activityLabels <- getStringColumn(
  file.path(dir, "activity_labels.txt"), 2)
featureLabels <- getStringColumn(
  file.path(dir, "features.txt"), 2)

desiredFeatures <- grepl(
  str_c("-mean\\(\\)", "-std\\(\\)", 
        sep="|"),
  featureLabels)

featureLabels <- str_replace_all(featureLabels, c(
  "\\(" = "",
  "\\)" = "",
  "-" = "_",
  "," = "_"
))

testData <- prepareData(dir = dir, name = "test",
                        yFactors = activityLabels, features = desiredFeatures, featureLabels = featureLabels)
trainData <- prepareData(dir = dir, name = "train",
                         yFactors = activityLabels, features = desiredFeatures, featureLabels = featureLabels)

allData <- rbind(trainData, testData)
