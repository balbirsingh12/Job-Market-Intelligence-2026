# 📊 Job Market Intelligence 2026

An end-to-end **Data Analyst portfolio project** that analyzes
job-market data to identify the most in-demand skills, job categories,
companies, locations, and experience requirements.

The project uses **Python, MySQL, SQL, and Power BI** to transform raw
job-posting data into actionable insights through data cleaning,
exploratory analysis, business queries, and an interactive five-page
dashboard.

------------------------------------------------------------------------

## 🎯 Project Objective

The goal of this project is to answer practical questions about the Data
Analyst job market:

-   Which skills are most demanded by employers?
-   Which companies have the most job postings?
-   Which locations have the highest number of opportunities?
-   How are jobs distributed across experience levels?
-   What skills are commonly associated with entry-level and senior
    roles?
-   How many skills are typically listed per job?
-   Can users interactively explore individual job postings?

------------------------------------------------------------------------

## 🛠️ Tools & Technologies

  Area                Tools
  ------------------- ---------------------------
  Programming         Python
  Data Analysis       Pandas, NumPy
  Visualization       Matplotlib, Power BI
  Database            MySQL
  Query Language      SQL
  BI & Dashboarding   Power BI, DAX
  Development         Jupyter Notebook, VS Code
  Version Control     Git & GitHub

------------------------------------------------------------------------

## 📁 Project Structure

``` text
Job-Market-Intelligence-2026/
│
├── Data/
│   ├── Raw/
│   │   ├── skills_rows.csv
│   │   ├── vacancies_rows.csv
│   │   └── vacancy_skills_rows.csv
│   │
│   └── Cleaned/
│       ├── skills_cleaned.csv
│       ├── vacancies_cleaned.csv
│       └── vacancy_skills_cleaned.csv
│
├── Python/
│   ├── 01_data_inspection.ipynb
│   ├── 02_Data_Cleaning.ipynb
│   └── 03_EDA.ipynb
│
├── SQL/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_data_validation.sql
│   ├── 04_insert_vacancies.sql
│   ├── 05_insert_skills.sql
│   ├── 06_insert_vacancy_skills.sql
│   └── 07_business_analysis.sql
│
├── PowerBI/
│   └── Job Market Intelligence 2026.pbix
│
├── Screenshot/
│
└── README.md
```

------------------------------------------------------------------------

## 🔄 Project Workflow

``` text
Raw Job Data
     ↓
Python Data Inspection
     ↓
Data Cleaning & Validation
     ↓
Cleaned CSV Files
     ↓
MySQL Database
     ↓
SQL Business Analysis
     ↓
Power BI Data Model
     ↓
DAX Measures & Interactive Dashboard
     ↓
Business Insights
```

------------------------------------------------------------------------

# 🐍 1. Python Data Analysis

Python was used to inspect, clean, transform, and analyze the job-market
data.

### Data preparation included:

-   Checking missing values
-   Checking duplicate records
-   Validating IDs
-   Cleaning company and location values
-   Standardizing job titles
-   Creating job categories
-   Creating experience categories
-   Preparing cleaned CSV files
-   Performing exploratory data analysis

### Dataset size

-   **2,154 job vacancies**
-   **2,033 unique skills**
-   **13,032 skill mappings**
-   **1,613 unique companies** after excluding `Unknown`
-   Approximately **777 unique locations**
-   **1,873 vacancies with skill information**
-   **86.95% skill coverage**
-   **0 duplicate records** in the cleaned tables

------------------------------------------------------------------------

# 🗄️ 2. MySQL & SQL Analysis

The cleaned data was loaded into a MySQL database named:

``` text
job_market_intelligence
```

### Main tables

``` text
skills
vacancies
vacancy_skills
```

### Relationships

``` text
skills
   │
   │ 1
   │
   └────── * vacancy_skills * ────── 1 vacancies
```

SQL was used for:

-   Database creation
-   Table creation
-   Data loading
-   Data validation
-   Aggregation
-   JOIN operations
-   Ranking
-   Skill-demand analysis
-   Company analysis
-   Location analysis
-   Experience-level analysis
-   Skill-pair analysis

------------------------------------------------------------------------

# 📊 3. Exploratory Data Analysis

### Key findings

#### Most demanded skills

The top skills identified in the dataset include:

1.  SQL --- 1,298
2.  Python --- 760
3.  Excel --- 692
4.  Tableau --- 685
5.  Power BI --- 568
6.  R --- 395
7.  Data Visualization --- 248
8.  Data Analysis --- 207
9.  SAS --- 169
10. Data Modeling --- 166

#### Skills per vacancy

-   Average skills per vacancy with skill data: **6.96**
-   Median: **5**
-   Maximum observed: **44**

#### Skill combinations

Some frequently occurring skill combinations include:

-   Power BI + Python
-   Excel + Power BI
-   Excel + Tableau
-   Excel + Python
-   R + Tableau
-   Data Visualization + SQL
-   Data Modeling + SQL
-   SQL + Snowflake

------------------------------------------------------------------------

# 📈 4. Power BI Dashboard

The final Power BI report contains **five interactive pages**.

## Page 1 --- Executive Overview

Provides a high-level view of the job market.

### KPIs

-   Total Vacancies: **2,154**
-   Total Companies: **1,613**
-   Total Skills: **2,033**
-   Skill Coverage: **86.95%**
-   Average Skills Per Job: **6.96**

### Visuals

-   Job Category Distribution
-   Experience Level Distribution
-   Top 10 Most Demanded Skills

------------------------------------------------------------------------

## Page 2 --- Skill Demand

Focuses on employer skill requirements.

### Visuals

-   Top 15 Most Demanded Skills
-   Top 10 Entry-Level Skills
-   Top 10 Senior-Level Skills
-   Experience Level filter
-   Skill-related KPIs

This page helps compare how skill demand changes across experience
levels.

------------------------------------------------------------------------

## Page 3 --- Jobs & Companies

Focuses on where opportunities are concentrated.

### Visuals

-   Total Vacancies
-   Total Companies
-   Total Locations
-   Top 15 Companies by Job Postings
-   Top 15 Job Locations
-   Data Analyst Jobs by Location

------------------------------------------------------------------------

## Page 4 --- Experience Analysis

Analyzes experience requirements across job postings.

### KPIs

-   Average Experience: **1.41 years**
-   Entry-Level Jobs: **271**
-   Senior Jobs: **229**

### Visuals

-   Jobs by Experience Level
-   Jobs by Required Experience
-   Average Experience by Job Level
-   Experience Level slicer

> **Important interpretation:** The average recorded experience value
> should not be interpreted as the exact experience required for every
> job because the dataset contains missing and zero experience values.

------------------------------------------------------------------------

## Page 5 --- Job Explorer

An interactive job-search style page.

### Filters

-   Job Category
-   Experience Level
-   Location
-   Company
-   Job Title

### Features

-   Search-enabled Location filter
-   Search-enabled Company filter
-   Search-enabled Job Title filter
-   Jobs Found KPI
-   Interactive job listings table

Users can combine filters to explore individual job postings.

------------------------------------------------------------------------

# 💡 Business Insights

Based on the analysis, several practical insights emerge:

### 1. SQL is highly important

SQL appears as the most frequently requested skill in the analyzed job
postings, making it a core skill for aspiring Data Analysts.

### 2. Python is a strong complementary skill

Python is also heavily represented, especially for roles involving data
analysis, automation, visualization, and advanced analytics.

### 3. Excel and BI tools remain important

Excel, Tableau, and Power BI have substantial demand, showing that
employers continue to value spreadsheet analysis and business
intelligence skills.

### 4. Skill requirements vary by experience

Entry-level and senior roles share core analytical skills, but senior
roles show stronger representation of areas such as data modeling and
advanced BI/analytics tools.

### 5. Job opportunities are geographically distributed

The dataset contains a wide range of locations, including
remote/anywhere opportunities and major global cities.

### 6. Job titles are highly varied

Although `Data Analyst` is the dominant category, the dataset also
includes specialized roles such as:

-   Senior Data Analyst
-   Business Data Analyst
-   Junior Data Analyst
-   Marketing Data Analyst
-   Financial Data Analyst
-   Healthcare Data Analyst
-   Product Data Analyst
-   Market Data Analyst
-   Reporting Analyst

------------------------------------------------------------------------

# 🎓 What I Learned

Through this project, I practiced:

-   Real-world data cleaning
-   Exploratory Data Analysis
-   Pandas and NumPy
-   SQL database design
-   SQL JOINs and aggregations
-   Business-oriented SQL analysis
-   Power BI data modeling
-   DAX measures
-   Interactive slicers
-   Dashboard design
-   Data storytelling
-   Translating analytical results into business insights

------------------------------------------------------------------------

# 🚀 Future Improvements

Possible future enhancements include:

-   Adding job salary analysis
-   Adding posting-date trend analysis
-   Building a skill recommendation system
-   Adding geographic mapping
-   Creating a machine-learning model for job classification
-   Adding automated data refresh
-   Tracking changes in skill demand over time

------------------------------------------------------------------------

# 👩‍💻 Author

**Balbir Singh**

Computer Science Graduate \| Aspiring Data Analyst

### Skills

`Python` `Pandas` `NumPy` `SQL` `MySQL` `Power BI` `DAX` `Tableau`
`Excel` `Data Analysis`

### Connect

-   GitHub: [Balbir Singh](https://github.com/balbirsingh12)
-   LinkedIn: [Balbir Singh](https://www.linkedin.com/in/balbir-singh-036088253/)

------------------------------------------------------------------------

## ⭐ Project Summary

**Job Market Intelligence 2026** demonstrates an end-to-end data
analytics workflow --- from raw job-market data and Python-based
cleaning to SQL business analysis and an interactive Power BI dashboard.

The project focuses on turning job-posting data into practical insights
that can help understand **skill demand, job opportunities, experience
requirements, companies, and locations** in the Data Analyst job market.
