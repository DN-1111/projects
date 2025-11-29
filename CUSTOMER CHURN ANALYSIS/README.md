Customer Churn Prediction — End-to-End Data Analysis & Machine Learning

This project analyzes and predicts telecom customer churn using Python, combining exploratory data analysis (EDA) with a full machine learning pipeline to identify at-risk customers and provide actionable retention strategies.

📁 Dataset
- Source: IBM Sample Telco Churn Dataset
- Rows: 7,043 customers
- Columns: 21 features including:
      - Demographics: gender, senior citizen, partner, dependents
      - Account details: tenure, contract type, payment method
      - Services: phone, internet, streaming, online security, tech support
- Target Variable: Churn (Yes/No)

🛠 Tools & Technologies Used
- Languages & Libraries: Python, Pandas, NumPy, Matplotlib, Seaborn, Scikit-Learn, Imbalanced-learn (SMOTE), SHAP, Joblib Environment, Jupyter Notebook

🔍 Exploratory Data Analysis — Key Findings
- Churn Rate: 26.54%
- Senior Citizens: Churn 41.68% (higher risk)
- Contract Type: Month-to-month churns 42.71% (highest segment)
- Payment Method: Electronic check churns 45.29%
- Services: No OnlineSecurity/TechSupport → significantly higher churn
- Tenure: New customers (0–15 days) churn ~39%; long tenure strongly reduces churn

📊 Statistical Validation
- T-test: Churners have significantly higher MonthlyCharges (p < 0.05)
- Chi-square tests: Strong association between churn and: Contract Type, Tenure Group, Internet Service

🧩 Feature Engineering
- TenureGroup bucketed categories (0–15, 16–30, 31–60, etc.)
- AvgCharges = TotalCharges / Tenure
- TechSupportBundle = count of support-related add-ons
- One-hotencoded all categorical features
- Scaled numeric variables with StandardScaler

🤖 Machine Learning Models
Models Trained: Logistic Regression, Random Forest, Decision Tree, Gradient Boosting, SVM, KNN, Naive Bayes

Class Imbalance Handling
- Applied SMOTE on minority class
- Improved recall for churners significantly

Threshold Tuning
- Optimized classification threshold for best F1-score
- Greatly improves churn recall

🏆 Final Model: Logistic Regression + SMOTE + Threshold Tuning
  
| Metric               | Score    |
| -------------------- | -------- |
| **ROC-AUC**          | **0.84** |
| **Recall (Churn)**   | **0.68** |
| **F1-score (Churn)** | **0.63** |
| **Accuracy**         | **0.78** |

✔ Prioritizes identifying churners
✔ Balanced precision–recall
✔ Best trade-off for business use

🧠 Model Explainability
Used SHAP values to interpret feature contributions:
* Top Churn Drivers
* High MonthlyCharges
* Short Tenure
* Fiber Optic Internet
* Month-to-Month contract
* Lack of Online Security / Tech Support

This ensures transparency and trust in the model’s decisions.

🚀 Deployment-Ready Output
* Saved final pipeline and model using joblib
* Created a predict_churn() function to score new customers with the tuned threshold
* Model is ready for integration into apps, dashboards, or APIs

✅ Business Recommendations
* Encourage long-term contracts with discounts
* Improve onboarding support for 0–30 day customers
* Offer security/support bundles
* Reduce pain points for fiber optic users
* Promote auto-pay methods to reduce churn

📌 Project Highlights
* Clean, structured notebook with markdown explanations
* Clear visual storytelling with well-labelled charts
* End-to-end workflow: EDA → Stats → ML → Explainability → Deployment
* Actionable business insights—not just model scores

🧠 What I Learned
* How to combine EDA and statistical testing to validate patterns
* Best practices in ML pipelines with preprocessing + modeling
* Handling imbalanced data effectively
* Using SHAP for interpretable machine learning
* Communicating complex findings in a business-friendly way


