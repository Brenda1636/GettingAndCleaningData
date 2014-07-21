GettingAndCleaningData
======================

The run_analysis.R file creates a tidy dataset using the following steps:
<ol>
<li>The training data for the subjects is read into R. The column name is changed to "subject" so that it has a descriptive column name.</li>
<li>The activities for the training data is ready into R. The column name is changed to "activity" so that it has a descriptive column name.</li>
<li>The training data set is read into R.</li>
<li>The features of the Samsung data is read into R. This is then used to name the columns of the training data so that the column names are descriptive.</li>
<li>The subject data, activity data, and training data is combined into one data.frame.</li>
<li>The test data for the subjects is read into R. The column name is changed to "subject" so that it has a descriptive column name.</li>
<li>The activities for the test data is ready into R. The column name is changed to "activity" so that it has a descriptive column name.</li>
<li>The test data set is read into R. The column names are set to descriptive meanings using the feature data that was read in previously.</li>
<li>The subject data, activity data, and test data is combined into one data.frame.</li>
<li>Both the data.frames for training and test data are combined into one big data.frame.</li>
<li>A data.frame is constructed with only the columns for "subject", "activity", any means, and any standard deviations.</li>
<li>The Activity data is read in and joined with the data.frame from above so that we know which activities correspond to each row of data. I removed the activity id column.</li>
<li>Finally, ddply in the plyr library, I calculate the means for each column in the dataset.</li>
</ol>