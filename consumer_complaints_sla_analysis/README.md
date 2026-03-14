# Service Operations SLA Analysis

## Executive Summary

This project analyzes customer complaint data to identify the main drivers of Service Level Agreement (SLA) breaches in service operations. Using SQL for data transformation and Tableau for visualization, the analysis highlights high-risk products, complaint categories and operational patterns that impact SLA performance.

---

## Project Overview
This project analyzes service operations performance using a consumer complaints dataset to identify the main drivers of SLA breaches and prioritize operational improvement areas.

The goal was to help leadership understand where service delays occur and prioritize operational improvements that would reduce SLA failures and improve customer response times.

---

## Business Problem

The organization was experiencing inconsistent SLA performance, with some customer complaints not being resolved within the expected timeframes. Leadership needed visibility into which products, complaint types and operational areas were contributing most to SLA breaches so they could prioritize improvement efforts effectively.

---

## Dataset

**Source:** Maven Analytics – Consumer Complaints Dataset  

The dataset contains customer complaint records submitted to financial service providers.  
It includes information about complaint categories, issue types, submission channels, geographic location and response timelines.

### Key Fields

- **Complaint ID** – Unique identifier for each complaint  
- **Product** – Financial product associated with the complaint (e.g., Credit Card, Checking Account)  
- **Issue** – Main issue reported by the customer  
- **State** – Location of the consumer submitting the complaint  
- **Submitted Via** – Channel used to submit the complaint (Web, Phone, Referral, etc.)  
- **Date Received** – Date when the complaint was received  
- **Company Response to Consumer** – Type of response provided by the company  
- **Timely Response?** – Indicates whether the response met the expected SLA timeframe  

### Dataset Size

- **Total records analyzed:** ~51,000 complaints  

---

## Tools Used

**Excel**  
- Initial data inspection  
- Basic data cleaning
- Column formatting and validation

**MySQL** 
- Data transformation  
- Feature engineering
- SLA metric creation  
- Operational analysis queries

**Tableau**  
- Data visualization
- Interactive dashboard design
- Operational insights presentation

---

## Project Workflow

1. **Data Inspection & Cleaning**
   - Reviewed dataset structure and handled missing values
   - Standardized fields for analysis

2. **Data Preparation (SQL)**
   - Created SLA eligibility and breach indicators
   - Derived operational metrics and complaint trends
   - Performed analysis across products, issues, geography and time

3. **Visualization (Tableau)**
   - Built an interactive dashboard to highlight operational insights
   - Designed visualizations to support prioritization and decision-making

---

## Skills Demonstrated

- Data Cleaning and Preparation
- SQL Data Transformation
- SLA Performance Analysis
- Root Cause Analysis
- Data Visualization
- Business Insight Generation

___
  
## Dashboard Overview

The dashboard provides a decision-focused view of SLA performance.

It includes:

- Overall SLA KPIs
- Product-level prioritization analysis
- Root cause analysis by issue category
- Geographic distribution of complaints
- Volume vs risk prioritization view
- Time trends in complaints and SLA performance

Dashboard Screenshot:

![Dashboard](images/SLA_breach_risk_analysis_dashboard.png)

---

## Key Insights

1. A small number of products such as checking accounts and credit cards generate both the highest complaint volume and the highest number of SLA breaches.

2. Complaint types related to account management and incorrect information reporting account for a significant portion of SLA breaches, indicating process inefficiencies in handling these cases..

3. Geographic analysis shows that breach rates remain relatively consistent across regions, suggesting the problem is systemic rather than location-specific.

4. Complaint volume and SLA breach rate are not strongly correlated. Operational efficiency and resource capacity likely influence SLA performance more than volume alone.

---

## Recommendations

- Prioritize operational improvements in high-volume, high-risk products.
- Standardize resolution workflows for the top issue categories driving SLA breaches.
- Monitor SLA performance over time to ensure improvements keep pace with complaint volume.
- Allocate support resources to regions with higher breach counts.

---

## Business Impact

This analysis helps leadership prioritize operational improvements in the areas contributing most to SLA breaches, enabling better resource allocation and improved customer service performance.

---

Overall, the project demonstrates how data analysis can help organizations identify operational bottlenecks and prioritize improvements that directly impact customer service performance.

___

## Repository Structure

```
consumer_complaints_sla_analysis/
│
├── data/
│   ├── consumer_complaints_raw.csv
│   └── consumer_complaints_cleaned.csv
│
├── sql/
│   └── sla_operations_analysis.sql
│
├── tableau/
│   └── sla_dashboard.twbx
│
├── images/
│   └── SLA_breach_risk_analysis_dashboard.png
│
└── README.md
```


