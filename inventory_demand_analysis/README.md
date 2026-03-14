# Inventory Imbalance & Demand Analysis

## Executive Summary
This project analyzes retail sales data to identify **inventory imbalance risks**, including products that may experience stock-outs due to high demand and products that may remain overstocked due to slower sales.

Using **Python for data preparation and transformation** and **Tableau for visualization**, the analysis highlights product demand patterns, store-level performance differences and sales trends over time. These insights help businesses make **data-driven decisions about inventory allocation and replenishment strategies**.

---

## Project Overview
This project analyzes **retail transaction data across multiple stores and products** to understand demand patterns and sales performance. The goal is to understand product demand, store performance and sales trends to support **better inventory planning decisions**.

---

## Business Problem

Retail businesses often face **inventory imbalance challenges**:

- Some products sell quickly and risk **stock-outs**
- Other products move slowly and create **excess inventory**

In addition, **demand patterns vary across store locations and time periods**, making it difficult to distribute inventory efficiently.

Leadership needs insights into:

- Which products drive the most revenue
- Which stores generate the highest sales
- How demand fluctuates over time

These insights enable **better inventory planning, replenishment and demand forecasting**.

---

## Project Objectives

The main objectives of this project are:

- Identify **fast-moving and slow-moving products**
- Analyze **store-level sales performance**
- Detect **store-specific demand patterns**
- Analyze **monthly demand trends**
- Provide insights to support **inventory planning decisions**

---

# Dataset

**Source:** Maven Analytics – Retail Toy Sales Dataset

The dataset contains **retail sales transactions across multiple stores and products**, including information about products, store locations and sales activity.

## Key Fields

- **Sale ID** – Unique identifier for each transaction  
- **Date** – Transaction date  
- **Store ID** – Store where the sale occurred  
- **Product ID** – Product sold  
- **Units** – Number of units sold  
- **Product Name** – Product name  
- **Product Category** – Product classification  
- **Product Price** – Retail price  
- **Store Name** – Store location  

## Dataset Size

- **Total transactions:** ~7,000+
- **Products:** 35
- **Stores:** 50

___


## Tools & Technologies

## Python (Pandas, NumPy)

- Data cleaning and validation
- Dataset merging and transformation
- Feature engineering
- Revenue calculation and aggregation
- Creation of analytical datasets

## Tableau

- Data visualization
- Interactive dashboard development
- Demand pattern exploration
- Business insight generation

---

## Project Workflow

## Data Preparation (Python)

Python was used to prepare and transform the data before visualization.

Key steps included:

1. Loading raw datasets (products, sales, stores).
2. Cleaning the data and correcting data types.
3. Converting date fields for time analysis.
4. Creating new metrics such as **Revenue = Units × Product Price**.
5. Merging datasets to build a unified analytical dataset.
6. Creating aggregated tables for analysis.

Generated datasets:

- Product performance
- Store performance
- Top product per store
- Monthly sales trend

These datasets were exported and used in Tableau.

##  Visualization (Tableau)

- Built an **interactive dashboard** to analyze demand patterns
- Designed visualizations to highlight **inventory imbalance risks**
- Created charts for **product performance, store comparison and sales trends**

---

# Skills Demonstrated

- Data Cleaning and Preparation
- Python Data Transformation (Pandas)
- Feature Engineering
- Demand Pattern Analysis
- Data Visualization
- Business Insight Generation

---

## Dashboard Overview

The dashboard provides a **decision-focused view of product demand and store performance.**

It includes:

- Overall sales KPIs
- Product-level revenue analysis
- Store performance comparison
- Product demand distribution across stores
- Monthly sales trend analysis

## Dashboard Preview

![Dashboard Screenshot](images/inventory_imbalance_and_demand_analysis.png)

---

## Key Insights

- **Revenue is highly concentrated in a small number of products.**  
  Product performance analysis shows that items such as **Lego Bricks** generate the largest share of revenue (~$2.39M). This indicates that a relatively small subset of products drives a significant portion of overall sales, increasing the risk of stock-outs if these high-demand products are not adequately replenished.

- **Demand varies significantly across store locations.**  
  The product-by-store heat map reveals that performance is not uniform across all stores. Certain products perform exceptionally well in specific locations while showing lower demand in others. This suggests that customer preferences vary geographically, making uniform inventory distribution inefficient.

- **A small number of stores generate a disproportionately large share of revenue.**  
  Store performance analysis indicates that top-performing stores such as **Maven Toys Ciudad de Mexico 2** generate the highest revenue, significantly outperforming other locations. High-impact stores contribute a large portion of overall sales and require consistent product availability to avoid revenue loss.

- **Sales trends show noticeable fluctuations throughout the year.**  
  Monthly sales trend analysis indicates that demand peaks between March and July (~110K units sold) and drops around October (~48K units sold), suggesting seasonal demand patterns that should be considered when planning inventory levels.

- **Operational risk exists due to demand concentration and uneven distribution.**  
  The combination of high-demand products, location-specific demand patterns and seasonal fluctuations creates potential inventory imbalance risks, where businesses may simultaneously face stock-outs for high-demand products and excess inventory for slower-moving items.

___

## Recommendations 

- **Prioritize replenishment for high-demand products.**  
  Products that contribute the largest share of revenue should be monitored closely and replenished frequently to prevent stock-outs and lost sales.

- **Implement demand-driven inventory allocation across stores.**  
  Allocate inventory based on store-specific demand patterns rather than distributing evenly across all locations. This ensures high-demand stores receive sufficient stock while minimizing overstock in low-demand stores.

- **Monitor slow-moving products and optimize stock levels.**  
  Evaluate lower-volume products regularly to avoid excessive inventory holding costs. Consider promotions, discounts or reduced reorder quantities to improve turnover.

- **Incorporate seasonal demand patterns into inventory planning.**  
  Use historical monthly sales trends to forecast future demand and adjust inventory levels during peak and low-demand periods.

- **Prioritize inventory availability in high-performing stores.**  
  Stores generating the highest revenue should receive priority in allocation, as stock-outs in these locations would have the greatest financial impact.

- **Overall Business Value:**  
  This analysis provides insights that can help businesses improve inventory allocation efficiency, reduce stock-out risk and minimize excess inventory holding costs.
  By identifying high-demand products, location-specific demand patterns and seasonal fluctuations, the business can **reduce stock-out risk, minimize excess inventory costs and improve revenue stability** through better inventory allocation strategies.

___

# Repository Structure

```
inventory_imbalance_demand_analysis/
│
├── data/
│   ├── raw_data/
│   │   ├── products.csv
│   │   ├── sales.csv
│   │   ├── stores.csv
│   │   └── calendar.csv
│   │
│   └── processed_data/
│       ├── product_performance.csv
│       ├── store_performance.csv
│       ├── product_store_demand.csv
│       └── monthly_sales_trend.csv
│
├── notebooks/
│   └── inventory_supply_chain_analysis.ipynb
│
├── tableau/
│   └── inventory imbalance and demand analysis dashboard.twbx
│
├── images/
│   └── inventory_imbalance_and_demand_analysis_.png
│
└── README.md
```

---



