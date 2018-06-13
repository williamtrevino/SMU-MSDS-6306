# Code book


## Project Description

Home work assignment 5

Each week of assignments is self contained in its respective week number under the Homework directory


### Collection of the raw data
yob2015.txt -- Name,Gender,Count
yob2016.txt -- Name,Gender,Count
both data sets can be found at: https://www.dropbox.com/sh/pdk0yr5uq5z6n71/AAAfrdmDO9nGZyzIpS2cOD0Pa?dl=0

### Cleaning of the data
Data sets were ';' delmited files

### R Variables
y2015 - Data Frame: contains frequencies of baby names including gender for 2015
	First_name: Factor
	Gender: Factor
	Count: int
y2016 - Data Frame: contains frequencies of baby names including gender for 2015
	First_name: Factor
	Gender: Factor
	Count: int
final - Data Frame: combined data of 2015 and 2016
Girls - Data Frame: Female names only in descending order.
top - Data Frame: top 10 rows from "Girls" Data Frame


