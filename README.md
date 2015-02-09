# TidyData
Getting and Cleaning Data Course Project:

 1. Read training dataset and test dataset into R, then merge them using `rbind_cols()`. We will get a new dataset *dat*: this solves part 1.
 2. Read *feature.txt* into R, assign features to variable names in dat: this solves part 4.
 3. Subset *dat* with regards to variable names which contain "mean()" or "std()". The new dataset *dat2* contains 79 variables: this solves part2. 
 4. *subject_test.txt*, *subject_train.txt* contain information about subject id, read and merge them. *y_test.txt*, *y_train.txt* contain information about activities, read and merge them. Then merge subject id, activities and *dat2* to a new dataset, say *dat3*.
 5. Use descriptive activity names from *activity_labels.txt* to name the activities in the *dat3*: this solves part 3.
 6. Group *dat3* by subject id and activities, then get the mean for each measurement in *dat3* using `summarise_each()`. Create a new dataset *dat4* then write it to local repository: this solves part 5.
