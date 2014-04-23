Getting-CleaningData
====================
### Introduction
In this project, you could find a R script `run_analysis.R`, it contains the function to implement the data analysis process which required by the coursera lecture `Getting and Cleaning Data`. Before you assess the program, please read this file first.

1.  Please download the data of this project from[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)], and unzip it.
2.  Please move the folder which contains the required data to the root of this project.
    You should have the structure like this:
    * Getting-CleaningData-->UCI HAR Dataset-->test
    * -------------------------------------------------------->train
    * -------------------------------------------------------->...
    
    Or, please specify the path of the folder by using `path` paramenter.
3.  Run the script `run_analysis.R` and you will get the output (by default, it is `output.txt`, you can also specify it by using `file.name` parameter) in the root of this project.
4.  If you want to observer the process of this script, please specify parameter `debug` as `TRUE`, then you will get some details when you runing it.

### Data Structure
1.  The data are extracted which only contain `mean` or `std` in their column name.
2.  The row of the output file indicating 30 different subjects, and the column of the output file indicating activity label and measurements.

### Prograss
The output file is created by the following processes:

1.  Read x, y and subject both in train and test folder.
2.  Merge train and test data.
3.  Label the column of x according to `features.txt`.
4.  Extract colmns of x according to the key words `mean` and `std`.
5.  Label the column of y, and replace its value with descriptive names.
6.  Label the column of subject.
7.  Merge x, y and subject into one called `data`.
8.  Split `data` according to `activity_labels`.
9.  Aggregate data according to `subject` in each activity.
10. Output result.
