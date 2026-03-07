# Inventory Imbalance & Demand Analysis

## Project Overview
This project analyzes retail sales data to identify **inventory imbalance issues**, where some products are overstocked while others face potential stock-outs. The goal is to understand product demand, store performance, and sales trends to support **better inventory planning decisions**.

The project combines **Python for data preparation** and **Tableau for visualization**, resulting in an interactive dashboard that highlights demand patterns and inventory risks.

---

## Business Problem

Retail businesses often struggle with **inventory imbalance**:

- Some products sell quickly and risk **stock-outs**, leading to lost sales.
- Other products move slowly and lead to **excess inventory costs**.
- Demand may vary across **different store locations**.
- Sales may also fluctuate **over time**.

Understanding these patterns helps businesses improve **inventory allocation and replenishment strategies**.

---

## Project Objectives

The main objectives of this project are:

- Identify **fast-moving and slow-moving products**
- Analyze **store-level sales performance**
- Detect **store-specific demand patterns**
- Analyze **monthly demand trends**
- Provide insights to support **inventory planning decisions**

---

## Tools & Technologies

- **Python**
  - Pandas
  - NumPy

- **Tableau**
  - Data visualization
  - Interactive dashboard development

---

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

---

## Dashboard Overview

The Tableau dashboard contains five main analytical components.

### 1. KPI Summary
Provides an overview of:
- Total Revenue
- Total Units Sold
- Number of Products
- Number of Stores

### 2. Top Revenue-Driving Products
A bar chart identifying products contributing most to revenue, helping detect fast-moving and slow-moving products.

### 3. Product Demand by Store
A heat map showing product demand across different stores using units sold.

### 4. Store Performance
A bar chart ranking stores based on revenue to identify high-performing locations.

### 5. Monthly Sales Trend
A time-series chart showing sales patterns across months.

---

## Key Insights

- A small number of products generate a large portion of revenue.
- Product demand varies significantly across stores.
- Some products show slow movement, indicating potential overstock risk.
- Sales fluctuate over time, suggesting seasonal demand patterns.

---

## Business Recommendations

- Prioritize replenishment of **high-demand products**.
- Review slow-moving products for potential promotions or reduced stock.
- Allocate inventory **based on store-level demand patterns**.
- Use historical sales trends to improve **demand forecasting**.

---

## Dashboard Preview

![Dashboard Screenshot](images/inventory_imbalance_and_demand_analysis.png)

---



