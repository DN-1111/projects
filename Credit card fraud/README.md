🧾 Project Overview

This project analyzes 284,807 anonymized credit card transactions, labeled as fraudulent or legitimate, with the goal of detecting fraud patterns, understanding behavioral signals, and building a machine learning model capable of identifying fraud with high accuracy.

The dataset includes PCA-transformed features (V1–V28), making it ideal for both statistical analysis and machine learning modeling.
Using Python for EDA + ML and Tableau for visualization, this project demonstrates how analytics and predictive modeling can work together to strengthen financial fraud detection systems.

🧰 Tools & Technologies
* Python: Pandas, NumPy, Matplotlib, Seaborn, Scikit-Learn, XGBoost, SHAP
* Visualization: Tableau
* Others: Jupyter Notebook, Joblib

📂 Dataset Information
* Source: Kaggle (Credit Card Fraud Detection)
* Features: Time, Amount, PCA components V1–V28, Class (0=Legit, 1=Fraud)
* Fraud accounts for only 0.17% → highly imbalanced classification problem

Project Workflow (Short)
1. EDA & Feature Engineering

Created Hour, AmountBin, and is_night features

Explored class imbalance, hourly patterns, and PCA correlations

Exported correlations for Tableau dashboard

2. Machine Learning

Models trained:

Logistic Regression

Random Forest

XGBoost (final)

Handled imbalance using scale_pos_weight.
Evaluated using ROC-AUC, precision, recall, F1, confusion matrix.

3. Threshold & Hyperparameter Tuning

Tuned probability threshold for fraud detection

Performed RandomizedSearchCV on XGBoost

Balanced business trade-offs (false positives vs false negatives)

4. Explainability (SHAP)

Identified top contributors → V14, V4, V12, V10

Explained individual fraud predictions

Ensures model transparency for real-world auditability

5. Deployment Readiness

Saved final model (.pkl)

Saved metadata (features + threshold)

Added prediction function for scoring new transactions

📊 Key Findings (Short)

Fraud happens mostly during late-night and mid-morning hours.

Fraud amounts are typically lower than legitimate ones.

PCA components (V14, V4, V12, V10) are strong fraud indicators.

Final XGBoost model achieved:

ROC-AUC ≈ 0.98

High recall & strong precision balance

Minimal false negatives with controlled false positives

🧠 What I Learned

Imbalanced classification techniques

Feature engineering for behavioral insights

ML model comparison, tuning, and threshold optimization

Model explainability using SHAP

Deployment-ready model saving + prediction pipeline

Dashboard design for fraud analytics

🔗 Dashboard:
https://public.tableau.com/views/CreditCardFraudAnalysis_17583612937270/Dashboard1


Tableau dashboard link:
https://public.tableau.com/views/CreditCardFraudAnalysis_17583612937270/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
