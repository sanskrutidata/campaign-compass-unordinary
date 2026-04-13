-- =====================
-- UNORDINARY WINTER SHINE CAMPAIGN
-- SQL Queries — Diagnostic, Predictive, Prescriptive Analysis
-- =====================

-- PHASE 2: DATA CLEANING

-- Duplicates 

SELECT CustomerID, COUNT(*) 
FROM campaign_data
GROUP BY CustomerID
HAVING COUNT(*) > 1;


-- Null values 

SELECT 
    COUNT(*) FILTER (WHERE CustomerID IS NULL) AS null_customerid,
    COUNT(*) FILTER (WHERE Age IS NULL) AS null_age,
    COUNT(*) FILTER (WHERE Gender IS NULL) AS null_gender,
    COUNT(*) FILTER (WHERE Income IS NULL) AS null_income,
    COUNT(*) FILTER (WHERE CampaignChannel IS NULL) AS null_channel,
    COUNT(*) FILTER (WHERE CampaignType IS NULL) AS null_type,
    COUNT(*) FILTER (WHERE AdSpend IS NULL) AS null_adspend,
    COUNT(*) FILTER (WHERE ConversionRate IS NULL) AS null_conversionrate,
    COUNT(*) FILTER (WHERE Conversion IS NULL) AS null_conversion
FROM campaign_data;


-- Distinct values in key columns 

SELECT DISTINCT CampaignChannel FROM campaign_data;
SELECT DISTINCT CampaignType FROM campaign_data;
SELECT DISTINCT Gender FROM campaign_data;


-- Numeric Column Ranges

SELECT 
    MIN(Age) AS min_age, MAX(Age) AS max_age,
    MIN(Income) AS min_income, MAX(Income) AS max_income,
    MIN(AdSpend) AS min_adspend, MAX(AdSpend) AS max_adspend,
    MIN(ConversionRate) AS min_convrate, MAX(ConversionRate) AS max_convrate,
    MIN(LoyaltyPoints) AS min_loyalty, MAX(LoyaltyPoints) AS max_loyalty
FROM campaign_data;


-- Standardise column values 

UPDATE campaign_data
SET CampaignChannel = INITCAP(LOWER(TRIM(CampaignChannel)));

UPDATE campaign_data
SET CampaignType = INITCAP(LOWER(TRIM(CampaignType)));

UPDATE campaign_data
SET Gender = INITCAP(LOWER(TRIM(Gender)));



-- Creating clean view of the data 

CREATE VIEW clean_campaign_data AS
SELECT 
    CustomerID,
    Age,
    Gender,
    Income,
    CampaignChannel,
    CampaignType,
    AdSpend,
    ClickThroughRate,
    ConversionRate,
    WebsiteVisits,
    PagesPerVisit,
    TimeOnSite,
    SocialShares,
    EmailOpens,
    EmailClicks,
    PreviousPurchases,
    LoyaltyPoints,
    Conversion
FROM campaign_data;


-- PHASE 3: DIAGNOSTIC ANALYSIS
-- Q1: Conversions by Channel
SELECT 
    CampaignChannel,
    COUNT(*) AS total_customers,
    SUM(Conversion) AS total_conversions,
    ROUND(AVG(ConversionRate)::numeric * 100, 2) AS avg_conversion_rate_pct,
    ROUND(SUM(AdSpend)::numeric, 2) AS total_spend,
    ROUND((SUM(Conversion)::numeric / COUNT(*)) * 100, 2) AS conversion_pct
FROM clean_campaign_data
GROUP BY CampaignChannel
ORDER BY total_conversions DESC;


-- Q2: Segment Performance
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25 Gen Z'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35 Millennials'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45 Elder Millennials'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55 Gen X'
        ELSE '56-69 Boomers'
    END AS age_segment,
    Gender,
    COUNT(*) AS total_customers,
    SUM(Conversion) AS total_conversions,
    ROUND((SUM(Conversion)::numeric / COUNT(*)) * 100, 2) AS conversion_pct,
    ROUND(AVG(Income)::numeric, 2) AS avg_income,
    ROUND(AVG(AdSpend)::numeric, 2) AS avg_spend
FROM clean_campaign_data
GROUP BY age_segment, Gender
ORDER BY conversion_pct DESC;

-- Q3: Funnel Analysis
SELECT
    CampaignChannel,
    ROUND(AVG(WebsiteVisits)::numeric, 2) AS avg_website_visits,
    ROUND(AVG(ClickThroughRate)::numeric * 100, 2) AS avg_ctr_pct,
    ROUND(AVG(PagesPerVisit)::numeric, 2) AS avg_pages_per_visit,
    ROUND(AVG(TimeOnSite)::numeric, 2) AS avg_time_on_site_mins,
    ROUND(AVG(ConversionRate)::numeric * 100, 2) AS avg_conversion_rate_pct,
    SUM(Conversion) AS total_conversions,
    ROUND((SUM(Conversion)::numeric / COUNT(*)) * 100, 2) AS conversion_pct
FROM clean_campaign_data
GROUP BY CampaignChannel
ORDER BY avg_ctr_pct DESC;

-- Q4: ROI Analysis
SELECT
    CampaignChannel,
    CampaignType,
    ROUND(SUM(AdSpend)::numeric, 2) AS total_spend,
    SUM(Conversion) AS total_conversions,
    ROUND(SUM(AdSpend)::numeric / NULLIF(SUM(Conversion), 0), 2) AS cost_per_conversion,
    ROUND(AVG(ConversionRate)::numeric * 100, 2) AS avg_conversion_rate_pct,
    ROUND((SUM(Conversion)::numeric / COUNT(*)) * 100, 2) AS conversion_pct
FROM clean_campaign_data
GROUP BY CampaignChannel, CampaignType
ORDER BY cost_per_conversion ASC;

-- Phase 4: PREDICTIVE ANALYSIS 
-- Q5: Top Segment + Channel Combination 
SELECT
    CampaignChannel,
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25 Gen Z'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35 Millennials'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45 Elder Millennials'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55 Gen X'
        ELSE '56-69 Boomers'
    END AS age_segment,
    Gender,
    COUNT(*) AS total_customers,
    SUM(Conversion) AS total_conversions,
    ROUND(AVG(ConversionRate)::numeric * 100, 2) AS avg_conversion_rate_pct,
    ROUND((SUM(Conversion)::numeric / COUNT(*)) * 100, 2) AS conversion_pct
FROM clean_campaign_data
GROUP BY CampaignChannel, age_segment, Gender
ORDER BY conversion_pct DESC;

-- Phase : PRESCRIPTIVE ANALYSIS
-- Q6 : Budget Reallocation
SELECT
    CampaignChannel,
    ROUND(SUM(AdSpend)::numeric, 2) AS total_spend,
    ROUND((SUM(AdSpend)::numeric / SUM(SUM(AdSpend)::numeric) OVER()) * 100, 2) AS spend_pct,
    SUM(Conversion) AS total_conversions,
    ROUND((SUM(Conversion)::numeric / SUM(SUM(Conversion)::numeric) OVER()) * 100, 2) AS conversion_share_pct,
    ROUND(SUM(AdSpend)::numeric / NULLIF(SUM(Conversion), 0), 2) AS cost_per_conversion
FROM clean_campaign_data
GROUP BY CampaignChannel
ORDER BY cost_per_conversion ASC;

-- =====================
-- END OF QUERIES
-- =====================

