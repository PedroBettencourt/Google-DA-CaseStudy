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

All of the analysis was done on MySQL and the visualizations were done on Tableau.

## Daily Activity

* For the daily activity, there are 35 distinct users.
* The data is imbalanced, with Wednesdays and Fridays having 184 entries, while Tuesdays have only 160.
* The day of the week when people burned the most calories, took the most steps, and had the longest activity was Saturday.
* On the other hand, on Sunday there is the least activity and less steps.
* See Appendix A for SQL query used

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
* See Appendix B for SQL query used

![Dashboard_4](https://github.com/user-attachments/assets/e952e5a1-652a-4b6d-971a-c18fbe46c7e2)

## Steps by Hour

* The data for the steps by hour comes from 35 distinct users.
* The hours with the most steps were 18 and 19.
  
![Dashboard_5](https://github.com/user-attachments/assets/551b1945-880c-4bf2-bce0-cc6ffa9a50eb)

---

# Act

* **Promote activity** on days when it is lower. On Sunday, for example, there could be step challenges or app notifications.
* **Challenge staying in bed**, like on Sundays, by sending engaging app notifications.
* **Promote better sleep habits** with a campaign that shows that better sleep is linked to lower sedentarism.
* **Target marketing on peak activity hours**, like app notifications at 18-19h to sustain higher activity levels.

---

# Appendix

### Apendix A

Query to see average activity according to the day of the week

```
SELECT 
    CASE WEEKDAY(ActivityDate)
        WHEN 0 THEN "Monday"
        WHEN 1 THEN "Tuesday"
        WHEN 2 THEN "Wednesday"
        WHEN 3 THEN "Thursday"
        WHEN 4 THEN "Friday"
        WHEN 5 THEN "Saturday"
        WHEN 6 THEN "Sunday"
    END AS weekday,
    AVG(TotalSteps) AS average_steps, 
    AVG(VeryActiveMinutes) AS average_very_active_min, 
    AVG(FairlyActiveMinutes) AS average_fairly_active_min, 
    AVG(LightlyActiveMinutes) AS average_lightly_active_min, 
    AVG(SedentaryMinutes) AS average_sedentary_min, 
    AVG(Calories) AS average_calories
FROM dailyactivity
GROUP BY weekday
ORDER BY 
    CASE weekday
        WHEN 'Monday' THEN 0
        WHEN 'Tuesday' THEN 1
        WHEN 'Wednesday' THEN 2
        WHEN 'Thursday' THEN 3
        WHEN 'Friday' THEN 4
        WHEN 'Saturday' THEN 5
        WHEN 'Sunday' THEN 6
    END;
```

### Apendix B

Query to see activity and sleep

```
SELECT d.Id, ActivityDate as date, TotalSteps, 
	VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, 
	SedentaryMinutes, Calories, 
	TotalMinutesAsleep, TotalTimeInBed
FROM dailyactivity d
JOIN sleep s
ON d.Id = s.Id AND d.ActivityDate = s.SleepDay;
```
