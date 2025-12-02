**🛣️ Road Crash Severity Analysis (India, 2022–2023)**

**Overview:**

This project analyzes India’s road crash data from 2022–2023 to uncover patterns in crash severity, time trends, geography, and vehicle combinations. Using SQL for data preprocessing and Tableau for visual analytics, the project converts messy, news-reported crash data into actionable insights for road safety and policymaking.

**Tools**
* SQL (MySQL) – Data cleaning & KPI calculation
* Tableau – Visualization & dashboard design

**🧾 Dataset**

Source: Media Reported Road Traffic Crash Data – Mendeley Data (2023)

Collected from The Times of India news articles using Python automation and NLP.
Each row represents one crash with details on date, location, type, vehicles, fatalities, and injuries.

**Process**
1. Data Cleaning 
* Replaced "NA" and invalid values with NULL
* Standardized date formats & extracted: year, month, weekday
* Split latitude–longitude fields using SUBSTRING_INDEX()
* Handled missing age/gender values
* Filtered dataset for 2022–2023
* Created cleaned view: cleaned_crash_data

2. KPI & Insight Preparation
* Total crashes, deaths, injuries
* Fatalities & injuries per crash
* Reporting delay metrics
* State-wise, demographic, crash-type, and vehicle-type breakdowns

3. Visualization

Built three dashboards for clean storytelling:
* Temporal & Demographic Trends
* Geographic Patterns
* Crash Type & Road Type Analysis

**Key Insights**
* 2,888 crashes → 6,557 deaths → 7,779 injuries
* Rural crashes were ~2× more deadly than urban
* Sundays & May recorded the highest fatalities
* 18–30 male group had the highest risk
* Head-on and overturn crashes were most fatal
* 2W vs Truck and Car vs Truck were deadliest combinations
* High-severity hotspots: Trungal, Kotli Jhajjar, Sohagi Pahad

**Recommendations**
* Strengthen enforcement on National & State Highways
* Improve trauma centers in rural & hilly regions
* Conduct safety audits at high-risk hotspots
* Targeted awareness campaigns for young male riders/drivers
* Add barriers, lighting & speed control on high-risk roads

**Tableau Dashboard**

🔗 https://public.tableau.com/views/Roadcrashanalysis/roadandcrashtype?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

**What I Learned**
* Advanced SQL cleaning & transformation
* Designing clean, theme-based dashboards
* Combining spatial, temporal & demographic analysis
* Turning messy, real-world data into actionable insights

