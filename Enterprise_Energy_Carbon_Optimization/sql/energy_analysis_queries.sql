CREATE DATABASE energy_project;
USE energy_project;
SHOW TABLES;

SELECT COUNT(*) AS total_rows
FROM clean_energy_data;


DESCRIBE clean_energy_data;

SELECT Timestamp
FROM clean_energy_data
LIMIT 5;

ALTER TABLE clean_energy_data
MODIFY COLUMN Timestamp DATETIME;

DESCRIBE clean_energy_data;
SHOW COLUMNS FROM clean_energy_data;

-- =========================================
--  Enterprise Energy KPI Aggregation
-- =========================================

SELECT 
    ROUND(SUM(Energy_Usage_kWh_), 2) AS total_energy_kWh
FROM clean_energy_data;

-- =========================================
-- Step 5: Energy Benchmark by Occupancy Level
-- =========================================

SELECT 
    Occupancy_Level,
    ROUND(AVG(Energy_Usage_kWh_), 2) AS avg_energy_kWh,
    ROUND(SUM(Energy_Usage_kWh_), 2) AS total_energy_kWh
FROM clean_energy_data
GROUP BY Occupancy_Level
ORDER BY avg_energy_kWh DESC;

-- Insight:
-- Low occupancy periods show the highest average energy usage.
-- This suggests potential inefficiencies during underutilized periods,
-- indicating opportunity for demand-based energy optimization.


-- =========================================
--  Building-Level Energy Ranking
-- =========================================

SELECT 
    Building_ID,
    ROUND(SUM(Energy_Usage_kWh_), 2) AS total_energy_kWh,
    ROUND(AVG(Energy_Usage_kWh_), 2) AS avg_hourly_energy
FROM clean_energy_data
GROUP BY Building_ID
ORDER BY total_energy_kWh DESC;

-- =========================================
--  Daily Energy & Carbon Trend
-- =========================================
SELECT 
    DATE(Timestamp) AS date,
    ROUND(SUM(Energy_Usage_kWh_), 2) AS daily_energy_kWh,
    ROUND(SUM(Carbon_Emission_kg), 2) AS daily_carbon_kg
FROM clean_energy_data
GROUP BY DATE(Timestamp)
ORDER BY DATE(Timestamp);

-- Insight:
-- The dataset spans 15 days in January 2025.
-- Daily aggregation enables trend analysis and identification
-- of short-term energy consumption fluctuations.



-- =========================================
--  Hourly Load Pattern Analysis
-- =========================================

SELECT 
    Hour,
    ROUND(AVG(Energy_Usage_kWh_), 2) AS avg_hourly_energy
FROM clean_energy_data
GROUP BY Hour
ORDER BY avg_hourly_energy DESC;

-- Insight:
-- Peak average energy usage occurs at 22:00.
-- This indicates significant late-evening demand.
-- Renewable strategies may require battery storage or load shifting,
-- as solar generation would not directly offset peak load at this hour.



-- =========================================
--  Peak Hour by Building Type
-- =========================================

SELECT 
    Building_Type,
    Hour,
    ROUND(AVG(Energy_Usage_kWh_), 2) AS avg_energy
FROM clean_energy_data
GROUP BY Building_Type, Hour
ORDER BY Building_Type, avg_energy DESC;


-- Insight: Building-Type Load Variation

-- Peak demand timing varies significantly by building type:
--
-- Industrial: Midday peak (solar-aligned)
-- Educational: Late evening peak
-- Residential: Evening peak
-- Commercial: Early morning peak
--
-- Implication:
-- Renewable integration strategy must be customized
-- by facility type rather than uniformly deployed.




-- =========================================
-- Final Strategic Summary
-- =========================================
-- Key Sustainability Findings:
--
-- 1. Total footprint: ~950 metric tons CO2 (15 days).
-- 2. Industrial buildings are best candidates for solar alignment.
-- 3. Evening peaks require storage or demand management.
-- 4. Energy inefficiency during low occupancy indicates automation gaps.
--
-- Recommended Focus Areas:
-- - Targeted solar deployment
-- - Battery-backed evening optimization
-- - Occupancy-linked energy controls
-- - Facility-level efficiency audits






