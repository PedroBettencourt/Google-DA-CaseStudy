-- CLEAN DATA

-- Merge the two tables
DROP TABLE IF EXISTS hourlysteps;
CREATE TABLE hourlysteps AS (
	SELECT *
	FROM hourlysteps_merged
	UNION
	SELECT *
	FROM hourlysteps_merged_2)
	ORDER BY Id;
    
-- Update table to correct date format
UPDATE hourlysteps SET ActivityHour = str_to_date(ActivityHour, '%m/%d/%Y%r');

-- Check for null values
SELECT * FROM hourlysteps WHERE StepTotal is null;

-- Count Id and days
SELECT COUNT(DISTINCT Id) FROM hourlysteps;

SELECT CASE weekday
        WHEN 0 THEN "Monday"
        WHEN 1 THEN "Tuesday"
        WHEN 2 THEN "Wednesday"
        WHEN 3 THEN "Thursday"
        WHEN 4 THEN "Friday"
        WHEN 5 THEN "Saturday"
        WHEN 6 THEN "Sunday"
        END AS day_week, 
        COUNT(weekday)/24
FROM (
	SELECT Id, WEEKDAY(DATE(ActivityHour)) as weekday 
    FROM hourlysteps
    ) sub 
GROUP BY weekday 
ORDER BY weekday;


-- Analyze
SELECT HOUR(ActivityHour), AVG(StepTotal)
FROM hourlysteps
GROUP BY HOUR(ActivityHour);