CREATE DATABASE operations_analytics;

USE operations_analytics;

SELECT COUNT(*) FROM consumer_complaints_raw_cleaned;

SELECT * FROM consumer_complaints_raw_cleaned
LIMIT 10;

CREATE TABLE consumer_complaints_clean AS
SELECT *
FROM consumer_complaints_raw_cleaned;



-- ========================================================================================
-- DATA QUALITY CHECKS
--  Validate data completeness and identify potential quality issues before transformations
-- =========================================================================================

-- Check total number of records loaded
SELECT COUNT(*) AS total_records
FROM consumer_complaints_clean;


-- Check missing values in key operational fields
SELECT
    SUM(CASE WHEN complaint_id IS NULL THEN 1 ELSE 0 END) AS missing_complaint_id,
    SUM(CASE WHEN date_received IS NULL THEN 1 ELSE 0 END) AS missing_date_received,
    SUM(CASE WHEN issue IS NULL THEN 1 ELSE 0 END) AS missing_issue,
    SUM(CASE WHEN company_response IS NULL THEN 1 ELSE 0 END) AS missing_company_response
FROM consumer_complaints_clean;


-- check Date Logic Issues
SELECT COUNT(*) AS invalid_date_order
FROM consumer_complaints_clean
WHERE date_received < date_submitted;


-- Check SLA Flag Completeness
-- Review values in SLA indicator column
SELECT timely_response_flag, COUNT(*) AS record_count
FROM consumer_complaints_clean
GROUP BY timely_response_flag;


-- Observation:
-- Majority of complaints received a timely response.
-- However, ~2.4k records indicate SLA breaches and
-- ~1.5k records have missing SLA information.
-- Missing SLA values may affect accurate breach rate
-- calculations and will be handled during transformation.


-- Check for Duplicate Complaint IDs
SELECT
    complaint_id,
    COUNT(*) AS duplicate_count
FROM consumer_complaints_clean
GROUP BY complaint_id
HAVING COUNT(*) > 1;

-- Observation:
-- Duplicate complaint IDs may indicate re-opened or re-logged cases. 
-- Handling strategy will be defined before deletion.



-- =====================================================
--  DATA CLEANING
-- =====================================================


--  Remove records missing complaint_id (primary key)
DELETE
FROM consumer_complaints_clean
WHERE complaint_id IS NULL;
-- Records without complaint_id were removed because they
-- cannot be uniquely identified or traced in analysis.


-- Remove records with invalid date order
DELETE
FROM consumer_complaints_clean
WHERE date_received < date_submitted;
-- Records where company received the complaint before it
-- was submitted indicate data entry issues and were excluded
-- to preserve timeline accuracy.


--  SLA flag missing values retained
-- Missing timely_response_flag values may indicate unresolved cases or reporting gaps. 


-- Validate record count after cleaning
SELECT COUNT(*) AS records_after_cleaning
FROM consumer_complaints_clean;


-- =====================================================
--  FEATURE ENGINEERING
-- Create operational and SLA-related metrics
-- required for delay, risk, and performance analysis
-- =====================================================

-- Create numeric SLA compliance flag
ALTER TABLE consumer_complaints_clean
ADD COLUMN sla_met TINYINT;

UPDATE consumer_complaints_clean
SET sla_met =
  CASE
    WHEN timely_response_flag = 'Yes' THEN 1
    WHEN timely_response_flag = 'No' THEN 0
    ELSE NULL
  END;

-- sla_met = 1 indicates SLA met
-- sla_met = 0 indicates SLA breached
-- NULL represents unresolved or unknown SLA status


-- Create Explicit SLA Breach Flag
-- Create SLA breach flag
ALTER TABLE consumer_complaints_clean
ADD COLUMN sla_breach_flag TINYINT;
UPDATE consumer_complaints_clean
SET sla_breach_flag =
  CASE
    WHEN sla_met = 0 THEN 1
    ELSE 0
  END;

-- sla_breach_flag = 1 highlights high-risk complaints


-- Find latest received date in dataset
SELECT MAX(date_received) AS max_date_received
FROM consumer_complaints_clean;

-- Create complaint aging metric (in days)
ALTER TABLE consumer_complaints_clean
ADD COLUMN complaint_age_days INT;
UPDATE consumer_complaints_clean
SET complaint_age_days =
  DATEDIFF(
    (SELECT MAX(date_received) FROM consumer_complaints_clean),
    date_received
  );
-- complaint_age_days represents how long a complaint
-- has been active in the system since company receipt


-- Create Aging Buckets
-- Create aging buckets for grouping
ALTER TABLE consumer_complaints_clean
ADD COLUMN aging_bucket VARCHAR(20);
UPDATE consumer_complaints_clean
SET aging_bucket =
  CASE
    WHEN complaint_age_days <= 30 THEN '0-30 days'
    WHEN complaint_age_days <= 90 THEN '31-90 days'
    WHEN complaint_age_days <= 180 THEN '91-180 days'
    WHEN complaint_age_days <= 365 THEN '181-365 days'
    ELSE '365+ days'
  END;
  
  -- Metric evaluation decision:
-- Complaint aging analysis was evaluated, but due to the multi-year historical nature of the dataset, aging buckets
-- did not provide meaningful segmentation.

ALTER TABLE consumer_complaints_clean
DROP COLUMN aging_bucket;


-- Validate new features
SELECT
  COUNT(*) AS total_records,
  SUM(sla_breach_flag) AS total_sla_breaches,
  AVG(complaint_age_days) AS avg_complaint_age
FROM consumer_complaints_clean;
  
  
  
-- ======================================
-- Exploratory Analysis & KPIs
-- ======================================

-- OVERALL SLA PERFORMANCE
SELECT
    COUNT(*) AS total_complaints,
    SUM(sla_met) AS sla_met_count,
    SUM(sla_breach_flag) AS sla_breach_count,
    ROUND(SUM(sla_breach_flag) / COUNT(*) * 100, 2) AS sla_breach_rate_pct
FROM consumer_complaints_clean
WHERE sla_met IS NOT NULL;

-- Insight:
-- Out of 61,022 complaints with known SLA status, 3.94% failed
-- to receive a timely response. While overall SLA compliance
-- is high, the absolute volume of SLA breaches (2,403 cases)
-- is operationally significant and warrants deeper analysis
-- to identify concentrated risk areas.


-- SLA Breach Concentration.

-- =====================================================
-- SLA BREACH CONCENTRATION BY PRODUCT
-- Identify product categories with highest
-- SLA breach volume and breach rate
-- =====================================================

SELECT
    product,
    COUNT(*) AS total_complaints,
    SUM(sla_breach_flag) AS sla_breach_count,
    ROUND(SUM(sla_breach_flag) / COUNT(*) * 100, 2) AS sla_breach_rate_pct
FROM consumer_complaints_clean
WHERE sla_met IS NOT NULL
GROUP BY product
HAVING COUNT(*) >= 100
ORDER BY sla_breach_count DESC;

-- Insight:
-- SLA breaches are highly concentrated in a small number of high-volume products. 
-- Checking/savings accounts and credit cards together account for the majority of total
-- SLA breaches due to their large complaint volumes.
-- Additionally, credit reporting and debt collection show significantly higher breach rates, indicating
-- process complexity and higher operational risk in hese categories.



-- =====================================================
-- SLA BREACH CONCENTRATION BY ISSUE
-- Identify issue types driving SLA breaches
-- =====================================================

SELECT
    issue,
    COUNT(*) AS total_complaints,
    SUM(sla_breach_flag) AS sla_breach_count,
    ROUND(SUM(sla_breach_flag) / COUNT(*) * 100, 2) AS sla_breach_rate_pct
FROM consumer_complaints_clean
WHERE sla_met IS NOT NULL
GROUP BY issue
HAVING COUNT(*) >= 100
ORDER BY sla_breach_count DESC
LIMIT 10;

-- Insight:
-- SLA breaches are driven by a mix of high-volume and high-complexity issues. 
-- Account management-related issues contribute the highest number of SLA breaches 
-- due to volume, while issues such as incorrect credit reporting and debt collection not owed show significantly
-- higher breach rates, indicating greater resolution complexity and process risk.




-- =====================================================
-- SLA BREACH HOTSPOTS (PRODUCT × ISSUE)
-- Purpose: Identify specific issue-level drivers of SLA
-- breaches within high-impact product categories
-- =====================================================

SELECT
    product,
    issue,
    COUNT(*) AS total_complaints,
    SUM(sla_breach_flag) AS sla_breach_count,
    ROUND(SUM(sla_breach_flag) / COUNT(*) * 100, 2) AS sla_breach_rate_pct
FROM consumer_complaints_clean
WHERE sla_met IS NOT NULL
  AND product IN (
        'Checking or savings account',
        'Credit card or prepaid card',
        'Credit reporting, credit repair services, or other personal consumer reports'
  )
GROUP BY product, issue
HAVING COUNT(*) >= 50
ORDER BY sla_breach_count DESC
LIMIT 15;

-- Insight:
-- SLA breaches are driven by specific product–issue combinations rather than products or issues alone.
-- Account lifecycle activities (opening, managing, closing)within checking and savings accounts generate 
-- the highest breach volume due to scale, while credit reporting and certain credit card issues show significantly 
-- higher breach rates, indicating greater resolution complexity.
-- These intersections represent the highest-impact targets for operational improvement.



-- =====================================================
-- SLA BREACH CONCENTRATION BY STATE
-- Purpose: Identify geographic regions contributing most to SLA breaches
-- =====================================================

SELECT
    state,
    COUNT(*) AS total_complaints,
    SUM(sla_breach_flag) AS sla_breach_count,
    ROUND(SUM(sla_breach_flag) / COUNT(*) * 100, 2) AS sla_breach_rate_pct
FROM consumer_complaints_clean
WHERE sla_met IS NOT NULL
  AND state IS NOT NULL
GROUP BY state
HAVING COUNT(*) >= 100
ORDER BY sla_breach_count DESC
LIMIT 15;

-- Insight:
-- SLA breaches are concentrated in high-volume states such as California, Florida, New York, and Texas,
-- largely due to complaint scale. However, several mid-volume states exhibit comparable or higher SLA breach rates, 
-- indicating localized operational inefficiencies rather than purely volume-driven effects. 
-- This suggests opportunities for region-specific process improvements.




-- =====================================================
-- SLA BREACH CONCENTRATION BY SUBMISSION CHANNEL
-- Purpose: Evaluate whether SLA breaches vary by complaint submission channel
-- =====================================================

SELECT
    submitted_via,
    COUNT(*) AS total_complaints,
    SUM(sla_breach_flag) AS sla_breach_count,
    ROUND(SUM(sla_breach_flag) / COUNT(*) * 100, 2) AS sla_breach_rate_pct
FROM consumer_complaints_clean
WHERE sla_met IS NOT NULL
  AND submitted_via IS NOT NULL
GROUP BY submitted_via
ORDER BY sla_breach_count DESC;

-- Insight:
-- SLA breaches are predominantly driven by web-based complaint submissions, which account for the majority
-- of total complaint volume and SLA breaches. 
-- While phone submissions also show a moderate breach rate, referral and postal channels demonstrate 
-- comparatively better SLA performance. 
-- This suggests that high-volume digital intake channels may be placing greater strain on
-- operational workflows.













