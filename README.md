# Missing_Values
Missing Data, is no more missing
I’m Dinesh Varma, pursuing master’s in Business Analytics at UT Dallas. You can check out the data set and code for this article at   . For any queries please feel free to contact.  After going through multiple articles and case studies I thought to narrate handling missing values in a simpler way. 
As we know the ideal requirement to start any analysis is having complete data (all cells are filled with relevant data). By in real life we often have some missing data/irrelevant data. When starting a new project one of the most common problems faced in cleaning data is handling missing values. 
Why does this missing data occur?
•	Human Error (User forgot to fill in a field)
•	Data lost while transferring from legacy systems
•	Users unwillingness to disclose their information (like income, age, etc.)
In most cases we aren’t fixing missing values. We are learning how to cope with it.
Let’s Get Started
Before we start any data exploration/analysis it’s good to get a general feel for data. To do that below questions would help.
	What are the features(columns) in the data?
	What are the data types of those features?
	Are there any missing values?
	Are there any complex data types for which missing values can’t be handled?
Let’s start with an example of real estate date. Open the .csv from the GitHub page for a quick look of data.
  
Though the dataset is smaller, but it can help you to handle real-world solutions.
Let’s import data into out R Studio. First we import required libraries followed by loading the data.
 

Output:
 
If the dataset if large you can preview using head () method. This method returns 6 rows in R & 5 rows in Python by default.
Let’s eliminate the columns that are not considered for analysis. In R we do this as below.
 
 
Let’s answer some of our above questions.
	What are the features?
ST_NUM: Street Number
ST_NAME: Street Name
OWN_OCCUPIED: Is the residence occupied
NUM_BEDROOMS: Number of bedrooms

	What are the expected data types?
ST_NUM: float or int
ST_NAME: string (Python), Character (R)
OWN_OCCUPIED: string (Python), Character (R) (“Y”: Yes, “N”: No)
NUM_BEDROOMS:  float or int
	To answer next question about missing values let’s look at below examples
Standard Missing Values
Consider ST_NUM column in our dataset
 
In the third row there’s an empty cell. In seventh row there’s an NA value. Both cells are missing values. Let’s see how R handles these
 
 
We see that R filled the empty cell with “NA” value using is.na () method. Empty cell and “NA” values were recognized as missing values. Both Boolean responses are TRUE.

Non-Standard Missing Values (Case where missing values are in different formats)
Let’s look at “Number of Bedrooms” column
 
This column contains 3 missing values: “n/a”, “NA”, “na”
Let’s use previous is.na () method to recognize “NA” as missing values.
 
 
R recognized only “NA” as missing value, but not the other types.  If many users are manually entering data, then this is a common problem.
An easy way to detect various formats is to list all such formats. Then we import the data, R will recognise them in right way.
 
 
This time, all the different formats were recognized as missing values.
You might catch all other possible formats like “- “,” “...etc by specifying them in the list. It is important to recognize these non-standard missing values for purposes of summarizing and transforming missing values.
Unexpected Missing Values (Case when unexpected data type is present in expected data type column)
If our feature is expected to be a string, but there’s a numeric type, then this is also a missing value. 
 
Let’s look at “Owner-occupied” column.
From previous examples, use is.na () method to recognise the missing values.
 
 We have an empty cell and numeric value. Our goal is to fill these cells with NA values.
Empty value: This can be achieved by specifying in missing_values list as below
missing_values  <- c("NA","na","n/a","")
 
 

Numeric Value: 
 
 
In R, we choose as. numeric () method to convert character to numeric. Later used ifelse() command to replace the numeric value.
Summarizing the missing values
Let’s fine the total number of missing values in our data set.
   
Replacing (This is one of the ways of handling missing data)
When handling missing values, we can avoid it, we can ignore it, we can account for it.
Check out for a detailed approach for dealing with missing data, by data scientist Matt Brems. 
Now let’s try some basic imputation. 
 
 

A very common way to replace missing values is using median 
 
 
 
Conclusion:
It’s inevitable dealing with missing values. In this article we went over few methods of handling missing values by detecting, summarizing and replacing missing values.

Resources:
1.)	https://github.com/matthewbrems/ODSC-missing-data-may-18/blob/master/Analysis%20with%20Missing%20Data.pdf 
2.)	https://www.dataoptimal.com/data-cleaning-with-python-2018/ 
 

 


