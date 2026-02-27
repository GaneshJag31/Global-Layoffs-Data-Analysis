-- =========================
-- EXPLORATORY ANALYSIS
-- =========================

SELECT *
FROM layoffs_staging2;

-- Largest layoff events
SELECT *
FROM layoffs_staging2
ORDER BY total_laid_off DESC;

-- Companies with highest funding
SELECT *
FROM layoffs_staging2
WHERE funds_raised_millions IS NOT NULL
ORDER BY funds_raised_millions DESC;

-- Companies with 100% layoffs (shutdown risk)
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
AND funds_raised_millions IS NOT NULL
ORDER BY funds_raised_millions DESC;

-- =========================
-- AGGREGATED INSIGHTS
-- =========================

-- Total layoffs by company
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
;

-- Dataset time range
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2
;

-- Layoffs by industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC
;

-- Layoffs by country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC
;

-- =========================
-- TIME ANALYSIS
-- =========================

-- Daily trend
SELECT `date`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `date`
ORDER BY 2 DESC
;

-- Yearly trend
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC
;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC
;

-- Monthly trend
SELECT SUBSTRING(`date`, 1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1,7)
GROUP BY `MONTH`IS NOT NULL
ORDER BY 1 ASC
;

-- =========================
-- ADVANCED ANALYSIS
-- =========================

-- Rolling cumulative layoffs
WITH Rolling_total AS
(
SELECT SUBSTRING(`date`, 1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1,7)
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total
;

-- Top 5 companies by layoffs each year
WITH Company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 desc
),
Company_year_rank AS
(
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_year_rank 
WHERE Ranking <= 5
;
