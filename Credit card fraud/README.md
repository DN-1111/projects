🧾 Project Overview

This project analyzes a dataset of 284,807 anonymized credit card transactions, labeled as fraudulent or legitimate.
The goal was to detect behavioral and time-based fraud patterns and explore correlations among PCA-transformed features (V1–V28).
Using Python for data analysis and Tableau for visualization, the project demonstrates how analytics can uncover hidden fraud signals and support financial risk mitigation.

🧰 Tools & Technologies
- Data processing and EDA: Python
- Libraries: Pandas, NumPy, Matplotlib, Seaborn
- Visualization and dashboard: Tableau
- Data Handling: CSV, feature binning, correlation analysis
- Others: Jupyter Notebook, GitHub

📂 Dataset Information
The dataset (available on Kaggle – Credit Card Fraud Detection
) contains:
- Time: Seconds since the first transaction
- V1–V28: PCA-transformed features (anonymized)
- Amount: Transaction amount
- Class: 0 = Legitimate, 1 = Fraudulent

Fraudulent transactions represent only 0.17% of the dataset, highlighting the real-world imbalance challenge in fraud detection.

🔍 Project Workflow

- Data Loading & Inspection:
  Loaded CSV data, checked structure, datatypes, and missing values.
- Feature Engineering:
  Created Hour column from the Time variable.
- Binned Amount into categories (Very Low, Low, Medium, High, Very High).
- Exploratory Data Analysis (EDA):
  Class imbalance visualization
  Transaction amount vs. class (log-scale boxplot)
  Fraud trends by hour of day
  Correlation analysis of all numerical features with the target class
- Correlation Export:
  Saved feature–fraud correlations as a CSV for Tableau visualization.
- Tableau Dashboard:
  Designed an interactive dashboard to visualize fraud frequency, time-based trends, and key correlations.

📊 Key Insights
- Fraudulent transactions are only 0.17% of total transactions.
- Fraud activity peaks at 2 AM and 11 AM, suggesting off-peak exploitation.
- Fraudulent transactions often have lower median amounts than legitimate ones.
- PCA features (V1–V28) show meaningful correlations with fraud likelihood.

🧠 Learnings
- Handling imbalanced datasets and extracting insights from anonymized data.
- Applying feature engineering to derive time and amount-based insights.
- Building a clear, interactive Tableau dashboard for effective communication.
- Strengthened data-to-insight storytelling and visualization design.
