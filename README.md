# Fitness Tracker Analysis

##  Introduction to the Problem

**Scenario**: You are a junior data analyst working on the marketing analyst team at Bellabeat.

**Bellabeat**: A high-tech company that manufactures health-focused smart products. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits.

### Bellabeat Company Products

**Bellabeat app:** The Bellabeat app provides users with health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits. This data can help users better understand their current habits and
make healthy decisions. The Bellabeat app connects to their line of smart wellness products.

**Leaf:** Bellabeat’s classic wellness tracker can be worn as a bracelet, necklace, or clip. The Leaf tracker connects to the Bellabeat app to track activity, sleep, and stress.

**Time:** This wellness watch combines the timeless look of a classic timepiece with smart technology to track user activity, sleep, and stress. The Time watch connects to the Bellabeat app to provide you with insights into your
daily wellness.

**Spring:** This is a water bottle that tracks daily water intake using smart technology to ensure that you are appropriately hydrated throughout the day. The Spring bottle connects to the Bellabeat app to track your
hydration levels.

**Bellabeat membership:** Bellabeat also offers a subscription-based membership program for users. Membership gives users 24/7 access to fully personalized guidance on nutrition, activity, sleep, health and beauty, and mindfulness based on their lifestyle and goals.

Urška Sršen, cofounder and Chief Creative Officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. 

---  

### Goal of the Junior Data Analyst

As a junior data analyst on Bellabeat's marketing team, my goal is to focus on one of Bellabeat’s products and analyze smart device usage data to better understand how customers are already using their smart devices.

Based on our findings, I will provide recommendations for how these trends can inform Bellabeat marketing strategy.

### Key Questions:

1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

**Stakeholders:** We will present our analysis to the Bellabeat executive team along with your high-level recommendations for Bellabeat’s marketing strategy.

You will produce a report with the following deliverables:

1. A clear summary of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of your analysis
5. Supporting visualizations and key findings
6. Your top high-level content recommendations based on your analysis

##  Report

### 1. Business Task

Analyze smart device usage data to better understand how customers are already using their smart devices. 

Based on our analysis, we will provide recommendations for how these trends can inform Bellabeat marketing strategy.

---

### 2. Data Sources

We used FitBit Fitness Tracker Data (available through Mobius). This data set contains personal fitness tracker from thirty FitBit Users.

The data set provides the following informations about users:

- Heart rate
- Calories
- Intensity
- Steps
- Sleep
- Mets
- Physical Activity (minutes and category).
- Weight, Fat, BMI.

The data are quite old, almost 10 years ago, so their accuracy may be affected by changes in user behavior over time. 

While the dataset contains valuable information about users, the sample size is relatively small, expanding it would improve the reliability of the analysis.

Furthermore having access to other factors, such as gender or age group, would allow for deeper and more targeted insights.

Despite these limitations, the dataset still allows us to identify trends and propose useful ideas and directions to BellaBeat stakeholders.

---

### 3. Data Cleaning & Manipulation

We decided to carry out our data cleaning using excel. In the minute_sleep file, we identified only one issue: approximately 560 duplicate values, all of which were removed. No other issues were found.

Afterwards, we decided to work with SQL (PostgreSQL) and successfully inserted all our data into the tables without any issues. We assumed that no data manipulation would be necessary.

---

### 4. Analysis Summary

Based on our analysis our findings are:

- On average, users take 6,662 steps, cover 4.66 km and burn approximately 2,189 calories per day.
- The daily average sleep time is 7 hours and 30 minutes.
- On average, users get more sleep on Saturdays and the least on Fridays. 
- There aren’t significant differences in steps across the days of the week. Wednesday has the highest average number of steps, while Sunday has the lowest.
- Most users wake up between 6 AM and 8 AM. They are most active, in terms of steps, between 12PM-1PM and between 5PM-8PM, gradually becoming less active after 8PM.
- There is a positive correlation between steps and calories. The more steps someone takes, the more calories they burn
- Users tend to be sedentary for the majority of the day (~545 minutes – 73%), followed by being lightly active (~170 minutes – 23%), very active (~17 minutes – 2%), and fairly active (~13 minutes – 2%). 
- There aren't significant differences in activity (sedentary, lightly active etc) across the days of the week.
Note: We chose to deduct the average sleep time from the sedentary period to produce more accurate results.

---

### 5. Visualizations 

![Line Chart](https://github.com/gntagkas/Fitness_Tracker_Analysis/blob/main/Graphs/Screenshot_3.png)

---

### 6. Recommendations

i) Αccording to research, the recommended number of daily steps varies depending on factors such as age, health goals, and physical condition. 
However, a general target range of 8,000–10,000 steps per day is suitable for most people.

Based on this, users currently fall short of the recommended goal (Our result: 6,662 steps/day).

We suggest implementing a customizable daily step goal, ideally between 8,000 and 12,000 steps. When users reach their goal, they should receive a notification.

Additionally, we observed that users are most active between 5PM and 8PM, which aligns with the time most people finish work.

A notification during this time encouraging users to complete their daily step goal could help increase engagement.

ii) According to our research, users tend to be sedentary for the majority of the day (~545 minutes – 73%). 

The 73% sedentary time aligns with findings from health studies on modern lifestyles but it can cause serious problems. We will share some reccomendations to make user more active.

Daily Target Of Small Movements: 

- Set a target e.g 250 steps per hour for 8 hours.
- Get a message in the end of the day: "5/8 active hours completed".

Time to Move:

- Get a notification when user is sedentary for more than 60 minutes. "You have been inactive for a while, its time for a short walk".

Statistics for Motivation

- Weekend report with a comment like. "You reduced your sedentary time by 30 minutes this week. Great job!".
