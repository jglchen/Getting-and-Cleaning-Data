##Code Book

This code book includes information about the source data, the transformations performed after collecting the data and some information about the variables of the resulting data sets.

##Study Design

The source data was collected from the UCI Machine Learning Repository to complete an assignment for a Coursera course named Getting and Cleaning Data instructed by Jeff Leek. The assignment involved working with the data set and producing tidy data representation of the source data. Below is a list of the operations done to achieve the outputs.

1. Downloaded the data set
2. Unzipped the data set into my chosen working directory
3. Loaded activity labels and features
4. Extract the selected features on mean and standard deviation
5. Loaded test and train data sets into data frames
6. Loaded source variable names for test and train data sets
7. Combined test and train data frames using rbind
8. Pair down the data frames to only include the extracted mean and standard deviation variables
9. Replace activity IDs with the activity labels for readability
10. Combine the data frames to produce one data frame containing the subjects, measurements and activities
11. Produce "merged_data.txt" with the combined data frame as the first expected output
12. Created another data set using the dplyr library to group the tidy data by subject and activity
13. Then applied the average calculations across the groups
14. Produce "calculated_data.txt" as the second expected output


##Variables

* SubjectId: 1 to 30 each representing a participant in the study



