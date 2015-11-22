# Tidy-DataSet

This script generate a tidy dataset with the average of each measure gathered through a lecture on the smartphone about the activity done by an user.  

The information gathered in the tidy dataset is:
- Subject identification
- Activity performed
- 66 features gathered by the smarphone, relate to mean and standart desviation about accelerometer and gyroscope signals
    * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    * Triaxial Angular velocity from the gyroscope.

The procedure to generate the tidy dataset has been the following:
<ol>
<li> Load the features file into a dataframe </li>
<li> Load activity_labels file into a dataframe in order to get the names of features and activities</li>
<li> Garther the tests data</li>
    <ul>
    <li> Read the volunteers from tests dataset</li>
    <li> Read the activities performed by volunteers of tests data set</li>
    <li> Combine activities with their corresponding labels and rename the columns</li>
    <li> Creation of data_test dataframe with subject, activities and features values</li>
        <ul>
        <li> Read de tests datatest</li>
        <li> Add the features relates only to mean() and std() (features which names end exactly in mean() or std())</li>
        <li> Add the subject identificator and activity to the features dataframe above.</li>
        </ul>
    </ul>
<li> Garther the train data</li>
    <ul>
    <li> Read the volunteers from train dataset</li>
    <li> Read the activities performed by volunteers of train data set</li>
    <li> Combine activities with their corresponding labels and rename the columns</li>
    <li> Creation of data_train dataframe with subject, activities and features values</li>
        <ul>
        <li> Read de tests datatest</li>
        <li> Add the features relates only to mean() and std() (features which names end exactly in mean() or std())</li>
        <li> Add the subject identificator and activity to the features dataframe above</li>
        </ul>
    </ul>
<li> Creation of a data_set combining test and train dataframes</li>
<li> Assign column names to this completed data set</li>
<li> Creation of the tidy dataset, calculating the mean of every measure, for each subject and activity</li>
    <ul>
        <li> Load the dplyr package (usefull to manage tables)</li>
        <li> Creation of a table to manage with the dplyr package</li>
        <li> Group by the data by Subject and Activity and calculate mean of every measure</li>
        <li> Write the result into a file named tidy_data_set.txt</li>
    </ul>
</ol>
