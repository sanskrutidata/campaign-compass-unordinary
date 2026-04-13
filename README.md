# Campaign Compass: A 360° Analysis of UNordinary's Winter Shine Campaign

> *Diagnostic | Predictive | Prescriptive Marketing Analytics*

---

## Project Overview

This project presents a full-spectrum data analytics case study on a multi-channel digital marketing campaign for **UNordinary** — a fictional gender neutral D2C haircare brand. The analysis covers three levels of business intelligence: diagnosing what happened, predicting what will happen, and prescribing what should be done next.

The project was built as part of a data analytics portfolio to demonstrate proficiency in SQL, data cleaning, exploratory analysis, and business insight generation using real-world marketing metrics.

---

## Brand Background — UNordinary

UNordinary is a gender neutral, inclusive haircare brand designed for all hair types, textures, and identities. Specialising in hair damage repair and scalp health, UNordinary was built for people who have felt overlooked by a beauty industry that has historically divided its products by gender and hair type.

The brand serves customers across all age groups — from Gen Z navigating heat damage to Elder Millennials dealing with scalp sensitivity and hair thinning. UNordinary believes extraordinary haircare should be accessible to everyone, without labels.

**Tagline:** *"Your hair. Your rules. UNordinary."*

---

## Campaign Brief — The Winter Shine Campaign

| | |
|---|---|
| **Campaign Name** | The Winter Shine Campaign |
| **Duration** | 3 months |
| **Budget** | $50,000 |
| **Goal** | Drive product purchases and acquire new customers |
| **Target Audience** | Adults aged 18–45, all hair types and genders |
| **Channels** | Instagram Ads (Social Media), Email Marketing, Google PPC, Referral Partnerships, SEO |
| **Campaign Types** | Awareness, Consideration, Conversion, Retention |

Winter was chosen as the campaign period because cold air, indoor heating and reduced humidity strip hair of moisture — making it the highest need season for UNordinary's core product range.

---

## Problem Questions

### Diagnostic — What happened?
1. Which channel drove the most conversions for the Winter Shine Campaign?
2. Which customer segment responded best to the campaign?
3. Where did the funnel break down — from impressions to clicks to conversions?
4. Which channel delivered the best ROI against spend?

### Predictive — What will happen?
5. Which segment and channel combination is most likely to convert in the next campaign?
6. If UNordinary runs Winter Shine again, which channel will perform best?

### Prescriptive — What should we do?
7. How should the $50,000 budget be reallocated for the next campaign?
8. Which audience should UNordinary prioritise going forward?
9. Which channel should be scaled, maintained, or cut?

---

## Dataset

**Source:** Digital Marketing Campaign Dataset by Rabie El Kharoua — Kaggle
**License:** CC BY 4.0
**Size:** 8,000 rows, 20 columns
**Type:** Synthetic dataset generated for educational purposes

**Key Columns Used:**
- CustomerID, Age, Gender, Income
- CampaignChannel, CampaignType
- AdSpend, ClickThroughRate, ConversionRate
- WebsiteVisits, PagesPerVisit, TimeOnSite
- SocialShares, EmailOpens, EmailClicks
- PreviousPurchases, LoyaltyPoints, Conversion

---

## Tools Used

| Tool | Purpose |
|---|---|
| **PostgreSQL / PgAdmin 4** | Data storage, cleaning, and SQL analysis |
| **Microsoft Excel** | Initial data exploration and query output storage |
| **Tableau** | Dashboard development and data visualisation |
| **Claude (Anthropic)** | AI assistance for SQL query guidance and project structuring |

---

## Project Workflow

```
Phase 1 — Data Exploration
└── Loaded dataset in Excel, reviewed 8,000 rows and 20 columns
    Noted channel types, campaign types, age range and income range

Phase 2 — Data Cleaning (SQL)
└── Checked for duplicates → 0 found
    Checked for null values → 0 found
    Verified distinct values in key columns
    Confirmed realistic numeric ranges
    Created clean_campaign_data view excluding confidential columns

Phase 3 — Diagnostic Analysis (SQL)
└── Wrote 4 SQL queries answering diagnostic problem questions
    Analysed channel performance, audience segments, funnel drop-off and ROI

Phase 4 — Predictive Analysis (SQL)
└── Wrote segment and channel combination query
    Synthesised diagnostic findings to predict next campaign performance

Phase 5 — Prescriptive Analysis (SQL)
└── Wrote budget reallocation query
    Developed channel strategy and audience priority recommendations

Phase 6 — Dashboard Development (Tableau)
└── Built 6 individual chart worksheets
    Assembled 3 dashboard pages — Diagnostic, Predictive, Prescriptive
    Applied UNordinary brand aesthetic throughout
```

---

## Key Findings

### Diagnostic
- **Best Channel by Conversions:** Referral — 1,518 total conversions at 88.31% conversion rate
- **Best Channel by CTR:** PPC — highest click through rate at 15.83%
- **Best Segment:** Elder Millennial Males (36–45) — 91.57% conversion rate, the highest of any segment
- **Funnel Leak:** Social Media shows the largest gap between CTR and conversion rate — visitors click but do not purchase
- **Best ROI:** PPC paired with Conversion campaign type — lowest cost per conversion at $5,137

### Predictive
- **Winning Combo:** SEO targeting Elder Millennial Males achieves the single highest conversion rate at 94.55%
- **Best Channel Next Campaign:** Referral followed by PPC, with SEO recommended for Elder Millennial targeting specifically
- **Underserved Opportunity:** Millennials (26–35) show strong conversion rates but significantly low reach — untapped potential

### Prescriptive
- **Budget Reallocation:** Increase PPC to $11,500 and SEO to $10,500. Reduce Email to $8,000 and Social Media to $9,000. Maintain Referral at $11,000
- **Priority Audience:** Elder Millennial Males as primary, Elder Millennial Females as secondary, Millennials 26–35 as growth opportunity
- **Channel Strategy:** Scale PPC and SEO. Maintain Referral. Cut Email Retention campaigns and Social Media Awareness campaigns specifically

---

## Recommendations Summary

| Channel | Decision | Reason |
|---|---|---|
| PPC | Scale Up | Lowest CPC at $5,612, underspent relative to conversions |
| SEO | Scale Up | Highest converting segment combo at 94.55% |
| Referral | Maintain | Perfectly balanced spend vs conversion share |
| Email | Partial Cut | Cut Retention type only — highest CPC at $6,163 |
| Social Media | Partial Cut | Cut Awareness type only — largest funnel leak |

---

## Dashboard Preview

The Tableau dashboard is structured across 3 pages:

- **Page 1 — Diagnostic:** Channel conversions, segment performance, funnel analysis, ROI heatmap
- **Page 2 — Predictive:** Top segment and channel combinations, key predictive insights
- **Page 3 — Prescriptive:** Budget reallocation chart, channel strategy, audience priorities

---

## Files In This Repository

| File | Description |
|---|---|
| `README.md` | Project overview and findings summary |
| `unordinary_queries.sql` | All SQL queries — cleaning, diagnostic, predictive, prescriptive |
| `unordinary_diagnostic_analysis.xlsx` | Excel workbook with 6 query output sheets |
| `unordinary_winter_shine_dashboard.twbx` | Tableau packaged workbook |
| `unordinary_winter_shine_dashboard.pdf` | Exported dashboard — all 3 pages |

---

## Author

**Sanskruti**
Aspiring Data Analyst | SQL · Excel · Tableau
*Portfolio Project — 2026*

---

*Dataset credit: Rabie El Kharoua via Kaggle. Used under CC BY 4.0 license.*
