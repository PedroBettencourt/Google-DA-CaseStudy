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


# Dataset

* The data was sourced from [FitBit Fitness Tracker Data from Morbius](https://www.kaggle.com/datasets/arashnic/fitbit).
* The dataset represents data from 30 users from from March 12, 2016 to May 12, 2016. 
* The dataset has 11 csv files for the 1st month and 18 for the 2nd.
* The data covers activity, steps, sleep, calories, weight, and heartrate.

### Dataset limitations

* The dataset only has 30 users.
* When checking for unique IDs, the daily activity data has 35 distinct users. This data is also not balanced as there are more entries on certain days of the week (184 entries on Wednesdays and Fridays, while only 160 on Tuesdays)
* 

# Data preparation

* The dataset for daily activity was seperated in 2 months so it was merged.
* The dates were converted to the correct date format.
* Entries with 0 total steps were removed, as this indicates that the tracking device was not used.
* Entries that had the same ID and date were removed, since they were duplicates, but had different values for the other fields, which is impossible.
* 

# Analysis

* The day of the week when people burned the most calories, took the most steps, and had the longest activity was Saturday.
* On the other hand, on Sunday there is the least activity and less steps.

![Dashboard_1](https://github.com/user-attachments/assets/af700465-a6dc-4105-bfdf-cf7bdc44b57b)
![Dashboard_2](https://github.com/user-attachments/assets/f9e96c09-6803-470f-8eea-83d41c443115)

* In terms of sleep, there's only data from April 12 to May 12. In total there are 413 entries from 24 distinct users.
* The data is imbalanced, as there are more entries on some days (66 entries on Wednesdays, while only 47 entries on Mondays).
* Sunday was the day when people slept and stayed in bed the longest.

![Dashboard_3](https://github.com/user-attachments/assets/a88cc059-09a0-4789-8c77-c03c12430d02)

