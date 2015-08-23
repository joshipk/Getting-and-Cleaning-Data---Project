# Getting-and-Cleaning-Data - Project

## The script run_analysis.R performs the 5 steps given in the project as given below -

  *  1. All the similar data is merged using the rbind() function. By similar means those files having the same number of columns and referring to the same varibles.
  *  2. Take only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the names from features.txt.
  *  3. Take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
  *  4. In the whole data, column names are corrected.
  *  5. Finally, generate a new dataset with all the averages for each subject and activity type 
  *  (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

