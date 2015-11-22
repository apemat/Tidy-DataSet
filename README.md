# Tidy-DataSet

This script generate a tidy dataset with the average of each measure gathered through a lecture on the smartphone about the activity done by an user.  

The information gathered in the tidy dataset is:
- Subject identification
- Activity performed
- 66 features gathered by the smarphone, relate to mean and standart desviation about accelerometer and gyroscope signals
    a) Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    b) Triaxial Angular velocity from the gyroscope.

The procedure to generate the tidy dataset has been the following:
1. Load the features file into a dataframe 
2. Load activity_labels file into a dataframe in order to get the names of features and activities
3. Garther the tests data
  a) Read the volunteers from tests dataset
  b) Read the activities performed by volunteers of tests data set
  c) Combine activities with their corresponding labels and rename the columns
  d) Creation of data_test dataframe with subject, activities and features values
      * Read de tests datatest
      * Add the features relates only to mean() and std() (features which names end exactly in mean() or std())
      * Add the subject identificator and activity to the features dataframe above
4. Garther the train data
  a) Read the volunteers from train dataset
  b) Read the activities performed by volunteers of train data set
  c) Combine activities with their corresponding labels and rename the columns
  d) Creation of data_train dataframe with subject, activities and features values
      * Read de tests datatest
      * Add the features relates only to mean() and std() (features which names end exactly in mean() or std())
      * Add the subject identificator and activity to the features dataframe above
5. Creation of a data_set combining test and train dataframes
6. Assign column names to this completed data set
7. Creation of the tidy dataset, calculating the mean of every measure, for each subject and activity
      * Load the dplyr package (usefull to manage tables)
      * Creation of a table to manage with the dplyr package
      * Group by the data by Subject and Activity and calculate mean of every measure
      * Write the result into a file named tidy_data_set.txt
