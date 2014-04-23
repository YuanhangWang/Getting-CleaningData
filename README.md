Getting-CleaningData
====================
### Introduction
In this project, you could find a R script `run_analysis.R`, it contains the function to implement the data analysis process which required by the coursera lecture `Getting and Cleaning Data`. Before you assess the program, please read this file first.

1.  Please download the data of this project from[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)], and unzip it.
2.  Please move the folder which contains the required data to the root of this project.
    You should have the structure like this:
    Getting-CleaningData-->UCI HAR Dataset-->test
                                          -->train
                                          -->...
    Or, please specify the path of the folder by using `path` paramenter.
3.  Run the script `run_analysis.R` and you will get the output (by default, it is `output.txt`, you can also specify it by using `file.name` parameter) in the root of this project.
4.  If you want to observer the process of this script, please specify parameter `debug` as `TRUE`, then you will get some details when you runing it.