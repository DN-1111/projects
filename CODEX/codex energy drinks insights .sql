use codex;


-- Demographic insights
-- 1.who prefers enery drink more?(gender)

SELECT 
    Gender,COUNT(respondent_id) AS pref_count
FROM
    dim_respondents
GROUP BY Gender
ORDER BY pref_count DESC;

-- 2.which age grp prefers energy drink more?

SELECT 
    Age,COUNT(respondent_id) AS pref_count
FROM
    dim_respondents
GROUP BY Age
ORDER BY pref_count DESC;

-- 3.which type of marketing reaches most youth?(15-30)

SELECT 
    AGE, marketing_channels, COUNT(*) AS pref_count
FROM
    dim_respondents dr
        JOIN
    fact_survey_responses f ON f.respondent_id = dr.respondent_id
WHERE
    Age IN ('15-18' , '19-30')
GROUP BY Age , Marketing_channels
ORDER BY pref_count DESC;


-- Consumer preferences
-- 1.what are preferred ingredients of energy drinks among respondents?

SELECT 
    Ingredients_Expected, COUNT(respondent_id) AS Pref_Count
FROM
    fact_survey_responses
GROUP BY Ingredients_Expected
ORDER BY Pref_Count DESC;

-- 2. what packaging preferences do respondents have for energy drinks?

SELECT 
    Packaging_preference, COUNT(respondent_id) AS Pref_Count
FROM
    fact_survey_responses
GROUP BY packaging_preference
ORDER BY Pref_Count DESC;


-- Competition Analysis
-- 1.who are current market leaders?

SELECT 
    Current_brands, COUNT(respondent_id) AS Pref_Count
FROM
    fact_survey_responses
GROUP BY Current_brands
ORDER BY Pref_Count DESC;

-- 2.what are primary reasons consumers prefer those brands over others?

SELECT 
    Reasons_for_choosing_brands AS Reason, COUNT(respondent_id) AS Pref_Count
FROM
    fact_survey_responses
GROUP BY Reasons_for_choosing_brands
ORDER BY Pref_Count DESC;


-- Marketinh channels and brand awareness
-- 1.which marketing channels can be used to reach more consumers?

SELECT 
    Marketing_channels, COUNT(respondent_id) AS Pref_Count
FROM
    fact_survey_responses
GROUP BY Marketing_channels
ORDER BY Pref_Count DESC;

-- 2.How effective are different marketing strategies and channels in reaching our customers?

SELECT 
    Marketing_channels, COUNT(respondent_id) AS pref_count
FROM
    fact_survey_responses
GROUP BY Marketing_channels
ORDER BY pref_count DESC;


-- ----Brand Penetration
-- 1.What do people think about our brand? (overall rating)

SELECT 
    Tried_before,taste_experience as Rating , COUNT(*) AS Respondent_Count
FROM
    fact_survey_responses
WHERE (tried_before='yes')
GROUP BY taste_experience
ORDER BY Respondent_count DESC;

-- 2.Which cities do we need to focus more on?

SELECT 
    City, COUNT(*) AS Resp_count, Brand_perception
FROM
    fact_survey_responses f
        JOIN
    dim_respondents dr ON f.respondent_id = dr.respondent_id
        JOIN
    dim_cities dc ON dr.city_id = dc.city_id
GROUP BY city, brand_perception
ORDER BY city;


-- -Purchase Behavior
-- 1. Where do respondents prefer to purchase energy drinks?

SELECT 
    Purchase_location, COUNT(respondent_id) AS Pref_count
FROM
    fact_survey_responses
GROUP BY Purchase_location
ORDER BY Pref_count DESC;

-- 2.What are the typical consumption situations for energy drinks among respondents?

SELECT 
    Typical_consumption_situations as Situation, COUNT(respondent_id) AS Pref_count
FROM
    fact_survey_responses
GROUP BY Situation
ORDER BY Pref_count DESC;

-- 3.What factors influence respondents' purchase decisions, such as price range and limited edition packaging?

SELECT 
    Limited_edition_packaging , COUNT(respondent_id) AS Pref_count
FROM
    fact_survey_responses
GROUP BY Limited_edition_packaging
ORDER BY Pref_count DESC;

SELECT 
    Price_range , COUNT(respondent_id) AS Pref_count
FROM
    fact_survey_responses
GROUP BY Price_range
ORDER BY Pref_count DESC;

-- Product Development
-- Which area of business should we focus more on our product development? (Branding/taste/availability)

SELECT 
    Brand_perception , COUNT(respondent_id) AS Pref_count
FROM
    fact_survey_responses
GROUP BY Brand_perception
ORDER BY Pref_count DESC;

SELECT 
    Taste_experience , COUNT(respondent_id) AS Pref_count
FROM
    fact_survey_responses
GROUP BY Taste_experience
ORDER BY Pref_count DESC;








 


