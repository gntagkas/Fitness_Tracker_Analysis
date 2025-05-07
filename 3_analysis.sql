/*
The main Analysis.
*/


-- Daily Average Steps
WITH table1 AS (
SELECT
    id,
    ROUND(AVG(total_steps_per_day),0) AS avg_steps_hour
FROM (
    SELECT
        id,
        EXTRACT(day FROM activity_hour) AS day,
        SUM(step_total) AS total_steps_per_day
    FROM hourly_steps
    GROUP BY id,day
)
GROUP BY id
)
SELECT
    ROUND(AVG(avg_steps_hour),0) AS Daily_Average_Steps
FROM table1;
-- Result: 6662 steps per day.


-- Average calories burned daily.
SELECT
    ROUND(AVG(calories),0) AS average_calories
FROM daily_activity;
-- Result: 2189.


-- Daily Average Distance
SELECT
    ROUND(AVG(totaldistance),2) AS Daily_Average_Distance
FROM daily_activity;
-- Result: 4.66km/day.


-- Daily Average Sleeptime.
WITH table2 AS(
SELECT
    id,
    ROUND((AVG(sleep_time)/60),1) AS avg_sleeptime_hour
FROM (
    SELECT
        id,
        EXTRACT(day FROM Sleep_Activity_minute) AS day,
        SUM(sleep_time_min) AS sleep_time
    FROM minute_sleep
    GROUP BY id,day
)
GROUP BY id
)
SELECT
    ROUND(AVG(avg_sleeptime_hour),1) AS Daily_Average_Sleeptime
FROM table2;
-- Result: 7:30hours.


-- Average steps per hour of the day.
SELECT
    EXTRACT(HOUR FROM activity_hour) AS hour,
    ROUND(AVG(step_total),1) AS avg_steps
FROM hourly_steps
GROUP BY hour
ORDER BY hour DESC;
-- Increasement of steps between 5PM-8PM.


-- Day of the week users are most active in terms of steps.
SELECT
    EXTRACT(dow FROM activity_hour) AS day_of_week,
    ROUND(AVG(step_total),1) AS Average_Steps
FROM hourly_steps
GROUP BY day_of_week;
-- We can't notice any significant differences.
-- Most active in Wesdenay.


-- Average minutes of activity level.
-- For sedentary activity, we chose to deduct the average sleep time.
SELECT 
    ROUND(AVG(VeryActiveMinutes), 0) AS very_active,
    ROUND(AVG(FairlyActiveMinutes), 0) AS fairly_active,
    ROUND(AVG(LightlyActiveMinutes), 0) AS lightly_active,
    ROUND(AVG(SedentaryMinutes), 0) - 450 AS sedentary
FROM daily_activity;
-- Very Active: 17 min.
-- Fairly Active: 13 min.
-- Lighly Active: 170 min.
-- Sedentary: 545 min.


-- Average Sleeptime Per Day Of Week
WITH table3 AS (
SELECT 
    id, 
    DATE(Sleep_Activity_minute) AS DATE, 
    EXTRACT(dow FROM Sleep_Activity_minute) AS Day_Of_Week,
    SUM(sleep_time_min) AS total_sleep_time_minutes
FROM minute_sleep
GROUP BY id, DATE(Sleep_Activity_minute),EXTRACT(dow FROM Sleep_Activity_minute)
)

SELECT
    Day_Of_Week,
    ROUND(AVG(total_sleep_time_minutes)/60,2) AS average_sleep_time
FROM table3
GROUP BY Day_Of_Week
ORDER BY Day_Of_Week;
-- Less Sleep Friday. 
-- More Sleep Saturday


-- Average BMI
SELECT
    ROUND(AVG(bmi),1) AS Average_BMI
FROM weight_info;
-- Result: 25.7
-- 18.5 - 24.9 -> Normalweight
-- 25.0 - 29.0 -> Overweight
SELECT
    DISTINCT id
FROM weight_info;
-- Only 11 different users provided informations.
-- We fall within the overweight category, but we would like more informations to make proper results.


-- Activity per day of week in percentage
SELECT
    EXTRACT(dow FROM date) AS day_of_week,
    ROUND(100.0 * AVG(VeryActiveMinutes) / AVG(total_minutes), 1) AS very_active_percent,
    ROUND(100.0 * AVG(FairlyActiveMinutes) / AVG(total_minutes), 1) AS fairly_active_percent,
    ROUND(100.0 * AVG(LightlyActiveMinutes) / AVG(total_minutes), 1) AS lightly_active_percent,
    ROUND(100.0 * AVG(SedentaryMinutes) / AVG(total_minutes), 1) AS sedentary_percent
FROM (
    SELECT
        *,
        (VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + SedentaryMinutes) AS total_minutes
    FROM daily_activity
) 
GROUP BY day_of_week
ORDER BY day_of_week;
-- Not big differences in activity per different day of the week.