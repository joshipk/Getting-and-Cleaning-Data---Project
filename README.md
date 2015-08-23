## Getting-and-Cleaning-Data - Project

### The script run_analysis.R performs the 5 steps given in the project as given below -

  *  1. Script loads the data from data files into data-frames.
  *  Then all the similar data (x, y and subject) is merged using the rbind() function. By similar means those files having the same number of columns and referring to the same varibles.
  *  2. Selects only those columns where mean and std (standard deviation) exists in the name of that observation. After extracting these columns, they are given the names from features.txt.
  *  3. Takes the activity names from activity_labels.txt and they are substituted in the dataset.
  *  4. In the whole data, column names are corrected.
  *  5. Finally, generates a new dataset with all the averages for each subject and activity type 
     (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this 
      repository. ddply() from the plyr package is used to apply colMeans() to get all required averages.

