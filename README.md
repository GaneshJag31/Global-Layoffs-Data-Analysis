# Global Layoffs Data Analysis (SQL Project)

## Project Overview

This project focuses on cleaning and analyzing global layoffs data using SQL to uncover workforce reduction trends across companies, industries, countries, and time.

The project demonstrates real-world data analyst skills including data cleaning, transformation, and exploratory analysis.

---

## Objectives

- Clean and standardize raw layoff data
- Remove duplicates and handle missing values
- Analyze layoffs by company, industry, country, and time
- Identify key business patterns and trends
- Generate insights useful for workforce and economic analysis

---

## Dataset

The dataset contains information about layoffs across companies worldwide:

- Company
- Location
- Industry
- Total Laid Off
- Percentage Laid Off
- Date
- Company Stage
- Country
- Funds Raised (Millions)

---

## Data Cleaning Steps

- Created staging tables to preserve raw data
- Removed duplicate records using window functions
- Standardized text fields (company, industry, country)
- Converted date column to proper DATE format
- Handled NULL and missing values
- Removed unusable records

Final cleaned table: `layoffs_staging2`

---

## Exploratory Analysis

Key analysis performed:

- Companies with highest layoffs
- Layoffs by industry and country
- Time-based trends (daily, monthly, yearly)
- Layoffs by company stage
- Funding vs layoffs relationship
- Top companies by layoffs per year
- Rolling cumulative layoffs trend

---

## Key Insights

- Technology and startup sectors experienced major workforce reductions.
- Layoffs increased significantly during certain economic periods.
- Highly funded companies were not immune to layoffs.
- Late-stage companies contributed large portions of layoffs volume.
- Geographic concentration of layoffs was visible across major tech hubs.

---

## SQL Skills Demonstrated

- Window Functions (ROW_NUMBER, DENSE_RANK)
- CTEs (Common Table Expressions)
- Aggregations and Grouping
- Data Cleaning Techniques
- Date Functions
- Joins and Updates
- Rolling Calculations

---

## Project Structure

- Data-Cleaning-Project.sql
- Data-Analysis-Project.sql
- [layoffs.csv](https://github.com/GaneshJag31/Global-Layoffs-Data-Analysis/blob/main/layoffs.csv)

---

## Business Impact

The analysis can help organizations:

- Monitor workforce reduction trends
- Identify high-risk industries
- Support strategic workforce planning
- Understand macroeconomic signals

---

## Author

Ganesh Jagtap  
Aspiring Data Analyst | SQL | Excel | Power BI
