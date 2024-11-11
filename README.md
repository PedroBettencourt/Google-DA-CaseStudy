# Google Data Analytics Certificate Case Study

---
 Case study at the end of the Google Data Analytics Certificate

 Author: Pedro Bettencourt
 
 Date: November 11, 2024
 
---


# Scenario

Bellabeat is a high-tech company specializing in health-focused products for women. 
Bellabeat is recognized as a successful small company but aims to grow into a more significant player in the global smart device market.
Urška Sršen, Bellabeat’s cofounder and Chief Creative Officer, sees potential in leveraging fitness data from smart devices to identify new growth opportunities for Bellabeat.


### Objective

* Analyze smart device fitness data.
* Uncover consumer behavior and usage patterns.
* Use insights to inform and enhance marketing strategies for Bellabeat.

---

# Dataset

* The data was sourced from [FitBit Fitness Tracker Data from Morbius](https://www.kaggle.com/datasets/arashnic/fitbit).
* The dataset represents data from 30 users from from March 12, 2016 to May 12, 2016. 
* The dataset has 11 csv files for the 1st month and 18 for the 2nd.
* The data covers activity, steps, sleep, calories, weight, and heartrate.

### Dataset limitations

* The dataset only has 30 users.
* When checking for unique IDs most of the sheets do not have 30 distinct users, having more or less.
* There is more data for the 2nd month, as some tracking statistics are missing from the 1st month.
* The dataset is also not balanced as there are more entries on certain days of the week.
 
---

# Data preparation

All data preparation was done on MySQL

* The dataset is seperated in 2 months, making it necessary to merge the spreadsheets.
* The dates were converted to the correct date format.
* Entries with 0 total steps were removed, as this indicates that the tracking device was not used.
* Entries that had the same ID and date were removed, since they were duplicates, but had different values for the other fields, which is impossible.
  
---

# Analysis

All of the analysis was done on MySQL and the visualization was done on Tableau.

## Daily Activity

* For the daily activity, there are 35 distinct users.
* The data is imbalanced, with Wednesdays and Fridays having 184 entries, while Tuesdays have only 160.
* The day of the week when people burned the most calories, took the most steps, and had the longest activity was Saturday.
* On the other hand, on Sunday there is the least activity and less steps.

![Dashboard_1](https://github.com/user-attachments/assets/af700465-a6dc-4105-bfdf-cf7bdc44b57b)
![Dashboard_2](https://github.com/user-attachments/assets/f9e96c09-6803-470f-8eea-83d41c443115)

## Sleep

* In terms of sleep, there's only data from April 12 to May 12. In total there are 413 entries from only 24 distinct users.
* The data is imbalanced, as there are more entries on some days (66 entries on Wednesdays, while only 47 entries on Mondays).
* Sunday was the day when people slept and stayed in bed the longest.

![Dashboard_3](https://github.com/user-attachments/assets/a88cc059-09a0-4789-8c77-c03c12430d02)

## Sleep and Daily Activity

* Comparing time slept with sedentary time, there is a correlation where the more time people slept, the less time people spent being sedentary.
* For activity, however, there was no correlation with time slept.

![Dashboard_4](https://github.com/user-attachments/assets/e952e5a1-652a-4b6d-971a-c18fbe46c7e2)

## Steps by Hour

* The data for the steps by hour comes from 35 distinct users.
* The hours with the most steps were 18 and 19.
![Dashboard_5](https://github.com/user-attachments/assets/551b1945-880c-4bf2-bce0-cc6ffa9a50eb)





