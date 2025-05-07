-- We will create our tables and insert data from the provided CSV files.

-- Table for hourly calories.
CREATE TABLE hourly_calories (
    id BIGINT,
    Activity_hour TIMESTAMP,
    Calories INT,
    PRIMARY KEY(id, Activity_hour)
);

COPY hourly_calories
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\hourlycalories.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM hourly_calories
LIMIT 10;

-- Table for hourly intensity.
CREATE TABLE hourly_intensity (
    id BIGINT,
    Activity_hour TIMESTAMP,
    total_intensity INT,
    average_intensity NUMERIC,
    FOREIGN KEY(id,Activity_hour) REFERENCES hourly_calories(id, Activity_hour)
);

COPY hourly_intensity 
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\hourlyIntensities.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM hourly_intensity
LIMIT 10;

-- Table for hourly steps.
CREATE TABLE hourly_steps (
    id BIGINT,
    Activity_hour TIMESTAMP,
    Step_total INT,
    FOREIGN KEY(id,Activity_hour) REFERENCES hourly_calories(id, Activity_hour)
);

COPY hourly_steps 
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\hourlySteps.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM hourly_steps
LIMIT 10;

-- Table for minute mets.
CREATE TABLE minute_mets (
    id BIGINT,
    Activity_minute TIMESTAMP,
    mets INTEGER,
    FOREIGN KEY(id, Activity_minute) REFERENCES minute_calories(id, Activity_minute)
);

COPY minute_mets 
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\minuteMETsNarrow.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM minute_mets
LIMIT 10;

-- Table for minute sleeps.
CREATE TABLE minute_sleep (
    id BIGINT,
    Sleep_Activity_minute TIMESTAMP,
    sleep_time_min INTEGER,
    logid BIGINT,
    PRIMARY KEY (id,Sleep_Activity_minute,logid)
);

COPY minute_sleep
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\minutes_sleep.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM minute_sleep
LIMIT 10;

-- Table for weight info.
CREATE TABLE weight_info (
    id BIGINT,
    Date TIMESTAMP,
    WeightKG NUMERIC,
    WeightPounds Numeric,
    FAT INT,
    BMI NUMERIC,
    Ismanualreport BOOLEAN,
    logid BIGINT,
    PRIMARY KEY (id,DATE)
);

COPY weight_info 
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\weightLogInfo.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM weight_info
LIMIT 10;

-- Table for daily activity.
CREATE TABLE daily_activity (
    id BIGINT,
    Date DATE,
    TotalSteps NUMERIC,
    TotalDistance NUMERIC,
    TrackerDistance NUMERIC,
    loggedactivitiesdistance NUMERIC,
    veryactivedistance NUMERIC,
    moderatelyactivedistance NUMERIC,
    lightactivedistance NUMERIC ,
    SedentaryActiveDistance NUMERIC,
    VeryActiveMinutes NUMERIC,
    FairlyActiveMinutes NUMERIC,
    LightlyActiveMinutes NUMERIC,
    SedentaryMinutes NUMERIC,
    Calories NUMERIC,
    PRIMARY KEY (id,DATE)
);

COPY daily_activity
FROM 'D:\SQL_Data_For_Projects\Data_For_Fitness_Tracker\dailyactivity_merged.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

SELECT *
FROM daily_activity
LIMIT 10;



