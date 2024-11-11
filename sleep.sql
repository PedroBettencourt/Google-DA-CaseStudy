-- CLEAN DATA

-- Update table to correct date format
UPDATE sleep SET SleepDay = str_to_date(SleepDay, '%m/%d/%Y %r');

-- Check for null values
SELECT * FROM sleep WHERE TotalMinutesAsleep is null;

-- Count Id and days
SELECT COUNT(DISTINCT Id) FROM sleep;

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
	SELECT Id, WEEKDAY(SleepDay) as weekday 
    FROM sleep
    ) sub 
GROUP BY weekday 
ORDER BY weekday;

-- ANALYSIS

-- See activity per weekday

SELECT * FROM sleep;

SELECT 
    CASE WEEKDAY(SleepDay)
        WHEN 0 THEN "Monday"
        WHEN 1 THEN "Tuesday"
        WHEN 2 THEN "Wednesday"
        WHEN 3 THEN "Thursday"
        WHEN 4 THEN "Friday"
        WHEN 5 THEN "Saturday"
        WHEN 6 THEN "Sunday"
    END AS weekday,
    AVG(TotalMinutesAsleep) AS average_sleep, 
    AVG(TotalTimeInBed) AS average_bed
FROM sleep
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