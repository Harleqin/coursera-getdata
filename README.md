This is my contribution to the course project of the Coursera course
“Getting and Cleaning Data”.

The base dataset is from:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

The provided script reassembles the given test and training sets into
a single data set, aggregates a subset of these data into a single
table and gives more explicit names to the variables and activity
names.

To run, place the unpacked data into a folder named "UCI HAR Dataset"
under the working directory (this is the name of the folder in the
provided ZIP file, so just unpack that into your working directory),
then load "run_analysis.R" and run run() from R.

The expected tidy dataset is written to
"averaged_subject_activity.txt" in the working directory.

Note that the values produced do not necessarily make sense for any
particular purpose.  It is just an exercise.