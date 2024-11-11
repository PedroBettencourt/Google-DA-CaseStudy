-- See activity and sleep data
SELECT d.Id, ActivityDate as date, TotalSteps, 
	VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, 
	SedentaryMinutes, Calories, 
	TotalMinutesAsleep, TotalTimeInBed
FROM dailyactivity d
JOIN sleep s
ON d.Id = s.Id AND d.ActivityDate = s.SleepDay;