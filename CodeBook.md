The file "averaged_subject_activity.txt" has 68 columns.

The first two ("Subject" and "Activity") give the subject number and
the activity name.  There are 30 subjects numbered from 1 to 30, and 6
activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING.

There is a row for each combination of subject and activity, thus 180
rows total (plus header).  Each row shows the average of each feature
for this subject and activity.

The columns 3 through 68 contain values derived from the raw
accelerometer and gyroscope measurements during the subjects'
activities.

The column names indicate the manner of this derivation in their parts
as follows:

- Body/Gravity

  The raw signal was split by Anguita et al. into the signal caused by
  the subjects motion and the signal caused by gravity.

- Acceleration/Gyroscope

  "Acceleration" denotes linear acceleration measured by the
  smartphone's accelerometer, in meters per second squared.
  "Gyroscope" denotes rotation measured by the smartphone's gyroscope,
  in radians per second.

- X/Y/Z/Magnitude

  The raw signals arrive separate by axis (X, Y, Z).  They were
  additionally combined by Euclidean norm into their magnitude.

- DerivedInTime

  These values are the derivation of the corresponding signal in time
  (this was called "Jerk" by Anguita et al.).  Acceleration derived in
  time is in meters per second cubed.  Rotation derived in time is in
  radians per second squared.

- FFT

  These values are obtained by Fast Fourier Transformation from the
  corresponding signals, are thus in frequency domain.  Units are not
  affected by this transformation.

- Mean/Standarddeviation

  For each feature, there is one column for the mean and one for the
  standard deviation.

For details on how the measurements were taken, please refer to the
file "features_info.txt" in the original dataset also included in this
repository.
