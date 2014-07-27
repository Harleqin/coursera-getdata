run <- function () {
    all.feature.names <- read.feature.names ()
    test.set <- read.set ("UCI HAR Dataset/test/subject_test.txt",
                          "UCI HAR Dataset/test/X_test.txt",
                          "UCI HAR Dataset/test/y_test.txt",
                          all.feature.names)
    train.set <- read.set ("UCI HAR Dataset/train/subject_train.txt",
                           "UCI HAR Dataset/train/X_train.txt",
                           "UCI HAR Dataset/train/y_train.txt",
                           all.feature.names)
    concatenated.set <- rbind (test.set, train.set)
    extracted.feature.names <- grep ("(mean\\.\\.|std\\.\\.)",
                                     all.feature.names,
                                     value = TRUE)
    extracted.features <- concatenated.set [, extracted.feature.names]
    colnames (extracted.features) <- canonicalize (extracted.feature.names)
    clear.activities <- translate.activities (concatenated.set$Activity.code)
    final.complete.set <- data.frame (Subject = concatenated.set$Subject,
                                      Activity = clear.activities,
                                      extracted.features)
    final.averaged.set <-
        aggregate (final.complete.set[,3:68],
                   by = final.complete.set[,c("Subject", "Activity")],
                   mean)
    write.table (final.averaged.set,
                 "averaged_subject_activity.txt",
                 row.names = FALSE)
}

read.feature.names <- function () {
    all.feature.names.table <- read.table ("UCI HAR Dataset/features.txt")
    make.names (all.feature.names.table$V2)
}

read.set <- function (subject.file, X.file, y.file, col.names) {
    subject <- read.table (subject.file, col.names = c("Subject"))
    X <- read.table (X.file, col.names = col.names)
    y <- read.table (y.file, col.names = c("Activity.code"))
    data.frame (subject, X, y)
}

canonicalize <- function (names) {
    tmp <- sub ("BodyBody", "Body", names)
    tmp <- sub ("^[t]", "", tmp)
    tmp <- sub ("^f(.*)$", "\\1.FFT", tmp)
    tmp <- sub ("Acc", ".Acceleration.", tmp)
    tmp <- sub ("Gyro", ".Gyroscope.", tmp)
    tmp <- sub ("Jerk", ".DerivedInTime.", tmp)
    tmp <- sub ("Mag", ".Magnitude.", tmp)
    tmp <- gsub ("\\.+", ".", tmp)
    tmp <- sub ("\\.$", "", tmp)
    tmp <- sub ("\\.mean(.*)", "\\1.Mean", tmp)
    tmp <- sub ("\\.std(.*)", "\\1.Standarddeviation", tmp)
    tmp
}

translate.activities <- function (code) {
    table <- read.table ("UCI HAR Dataset/activity_labels.txt")
    lookup <- table$V2
    lookup[code]
}