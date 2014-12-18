##How the script works
In lines 1-8 the data are imported in R and each file is assigned to a specific name.
If this is done the following things are done (first for the test set, then same thing for the training set):
*lines 10-13: In the names of the features special characters are removed (these are (, ) and -), because these may be considered as special characters by R. Features are assigned to the dataset.
*line 15: the variables with 'mean' and 'std' are selected
*lines 17-18: activity code is added to the dataset.
lines 20-21: number of the volunteer is added with the header 'subject'.
*lines 25-32 the same is done for the train set.


lines 35: merging of test set and train set.
lines 38-47: column with intuitive description of the activity (walking, sitting etc.) is added, column with activity number is removed.
lines 50-54: calculates the mean for each subject and each activity: 6 activities x 30 subjects = 180 rows for each variable.


##Code Book
The resulting txt file that was created with the script contains 180 rows and 81 columns.  
The columns have the following meaning:
*culumn1: subject
This is the number of each subject that participated (1-30)

*column 2: activity
This is the description of the activity that each subject has done, there are 6 different ativities.

*column 3-81: the measured variables
These are the means and standard deviations of the measured variables, one for each subject and each activity.
colnames(aggdata) will give you an overview over all these variables.
