-- CLEAN DATA

-- Update table to correct date format
UPDATE dailyactivity_merged_2 SET ActivityDate = str_to_date(ActivityDate, '%m/%d/%Y');

-- Merge the two tables
DROP TABLE IF EXISTS dailyactivity;
CREATE TABLE dailyactivity AS (
	SELECT *
	FROM dailyactivity_merged
	UNION
	SELECT *
	FROM dailyactivity_merged_2)
	ORDER BY Id;
    
-- remove rows where steps = 0
DELETE FROM dailyactivity WHERE TotalSteps = 0;

-- remove entries where the id and the date are the same (but have different values for other stuff)    
DELETE FROM dailyactivity WHERE Id IN (
	SELECT Id FROM (
		SELECT Id, ActivityDate
		FROM dailyactivity
		GROUP BY Id, ActivityDate
		HAVING COUNT(*) > 1) a) 
	AND ActivityDate IN(
		SELECT ActivityDate FROM (
		SELECT Id, ActivityDate
		FROM dailyactivity
		GROUP BY Id, ActivityDate
		HAVING COUNT(*) > 1) a);


-- Check NULL
SELECT * FROM dailyactivity WHERE Calories is NULL;


-- Count Id and days
SELECT COUNT(DISTINCT Id) FROM dailyactivity;

SELECT CASE weekday
        WHEN 0 THEN "Monday"
        WHEN 1 THEN "Tuesday"
        WHEN 2 THEN "Wednesday"
        WHEN 3 THEN "Thursday"
        WHEN 4 THEN "Friday"
        WHEN 5 THEN "Saturday"
        WHEN 6 THEN "Sunday"
        END AS day_week, 
        COUNT(weekday) 
FROM (
	SELECT Id, WEEKDAY(ActivityDate) as weekday 
    FROM dailyactivity
    ) sub 
GROUP BY weekday 
ORDER BY weekday;


-- ANALYSIS

-- See activity per weekday
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