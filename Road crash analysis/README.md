🛣️ Road Crash Severity Analysis (India, 2022–2023)

📘 Overview:
Analyzed India’s 2022–2023 road crash data to uncover patterns in crash severity, time trends, geography, and vehicle types. Combined SQL for preprocessing and Tableau for visualization to identify high-risk areas and factors contributing to severe crashes.

📊 Tools
- SQL (MySQL) – Data cleaning & KPI calculation
- Tableau – Visualization & dashboard design

🧾 Dataset

Source: Media Reported Road Traffic Crash Data – Mendeley Data (2023)

Collected from The Times of India news articles using Python automation and NLP.
Each row represents one crash with details on date, location, type, vehicles, fatalities, and injuries.

🧹 Preprocessing (SQL)
- Replaced 'NA' with NULL
- Split latitude & longitude
- Standardized date formats
- Handled missing values
- Created a cleaned view (cleaned_crash_data)

📈 Dashboards

1️⃣ Temporal & Demographic: Crash trends by day, month, age, gender
2️⃣ Geographical: Map of high-risk states & rural vs urban severity
3️⃣ Crash & Road Type: Head-on, overturn, and vehicle combo analysis

💡 Key Insights
- 2,888 crashes → 6,557 deaths, 7,779 injuries
- Sundays & May were most dangerous
- Rural crashes twice as deadly as urban ones
- Head-on collisions & two-wheeler vs truck most fatal

🚀 Outcome:
Delivered actionable recommendations for targeted enforcement, rural emergency response, and highway safety improvements.

